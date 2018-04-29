import React from "react";
import NetworkHandler from "../NetworkHandler";
import Layout from "./Layout";
import FontAwesome from "react-fontawesome";

export default class Watch extends React.Component {
  state = {
    "arcs": [],
    "selectedArc": null,
    "selectedEpisode": null,
  };
  componentDidMount() {
    NetworkHandler.request("/get_streams.php", {}, (response) => {
      const { arcs } = response;
      const selectedArcId = localStorage.getItem("watchSelectedArcId");
      const selectedEpisodeId = localStorage.getItem("watchSelectedEpisodeId");
      let selectedArc = null;
      let selectedEpisode = null;
      if (arcs.length > 0 && selectedArcId != null) {
        [selectedArc] = arcs.filter((i) => i.id === selectedArcId);
        if (selectedArc != null && selectedEpisodeId != null && selectedArc.episodes.length > 0) {
          [selectedEpisode] = selectedArc.episodes.filter((i) => i.id === selectedEpisodeId);
        }
      }
      if (selectedArc == null && arcs.length > 0) {
        [selectedArc] = arcs;
        if (selectedArc != null && selectedArc.episodes.length > 0) {
          [selectedEpisode] = selectedArc.episodes;
        }
      }
      this.setState({
        "selectedArc": selectedArc,
        "selectedEpisode": selectedEpisode,
        "arcs": arcs,
      });
    });
  }
  changeArc = (arcId) => {
    let selectedArc = null;
    let selectedEpisode = null;
    if (this.state.arcs.length > 0) {
      [selectedArc] = this.state.arcs.filter((i) => i.id === arcId);
      if (selectedArc != null) {
        localStorage.setItem("watchSelectedArcId", selectedArc.id);
        if (selectedArc.episodes.length > 0) {
          [selectedEpisode] = selectedArc.episodes;
        }
        if (selectedEpisode != null) {
          localStorage.setItem("watchSelectedEpisodeId", selectedEpisode.id);
        }
      }
    }
    this.setState({
      "selectedArc": selectedArc,
      "selectedEpisode": selectedEpisode,
    });
    this.videoRef.load();
  }
  changeEpisode = (episodeId) => {
    let selectedEpisode = null;
    if (this.state.arcs.length > 0 && this.state.selectedArc != null && this.state.selectedArc.episodes.length > 0) {
      [selectedEpisode] = this.state.selectedArc.episodes.filter((i) => i.id === episodeId);
      if (selectedEpisode != null) {
        localStorage.setItem("watchSelectedEpisodeId", selectedEpisode.id);
      }
    }
    this.setState({ "selectedEpisode": selectedEpisode });
    this.videoRef.load();
  }
  render() {
    const {
      selectedArc,
      selectedEpisode,
      arcs,
    } = this.state;
    const episodes = selectedEpisode != null && selectedEpisode.episodes != null && selectedEpisode.episodes.length > 0 ? "Episodes: " + selectedEpisode.episodes : "";
    const chapters = selectedEpisode != null && selectedEpisode.chapters != null && selectedEpisode.chapters.length > 0 ? "Chapters: " + selectedEpisode.chapters : "";
    const torrent = selectedArc != null && selectedArc.torrent != null ? selectedArc.torrent : selectedEpisode != null && selectedEpisode.torrent != null ? selectedEpisode.torrent : null;
    const animetoshoq = selectedArc != null && selectedEpisode == null ? "One Pace " + selectedArc.title : selectedEpisode != null ? selectedEpisode.crc32 : null;
    return (
      <Layout>
        <div className="watch-container">
          <iframe style={{"display": "none"}} name="magnetframe"></iframe>
          <div className="top">
            <select
              className="arcs"
              value={selectedArc == null ? 0 : selectedArc.id}
              onChange={(e) => this.changeArc(e.target.value)}
            >
              {
                (arcs.length == 0 && <option>Loading...</option>) ||
                arcs.map((arc, i) => {
                  let title = arc.title.length > 0 ? arc.title : "Untitled";
                  title += arc.chapters != null && arc.chapters.length > 0 ? " (Chapter " + arc.chapters + ")" : "";
                  return <option key={"arc" + i} value={arc.id}>{title}</option>;
                })
              }
            </select>
            <select
              className="episodes"
              value={selectedEpisode == null ? 0 : selectedEpisode.id}
              onChange={(e) => this.changeEpisode(e.target.value)}>
              {
                (arcs.length == 0 && <option>Loading...</option>) ||
                (selectedArc == null && <option>No arc selected</option>) ||
                selectedArc.episodes.map((episode, i) => {
                  let title = selectedArc.title + " " + (i + 1);
                  title += episode.title.length > 0 ? ": " + episode.title : "";
                  const status = episode.status.length > 0 ? " (" + episode.status + ")" : !episode.isReleased ? " (Unreleased)" : "";
                  title += status;
                  return <option disabled={!episode.isReleased} key={"episode" + i} value={episode.id}>{title}</option>;
                })
              }
            </select>
            {torrent != null &&
              <span>
                <a className="torrent" href={"/torrents/" + torrent.torrent_name}>
                  <FontAwesome name="download" /> Torrent
                </a>
                <a className="magnet" href={torrent.magnet}>
                  <FontAwesome name="magnet" /> Magnet
                </a>
              </span>
            }
            {animetoshoq != null &&
              <a target="_blank" rel="noopener noreferrer" className="animetosho" href={"https://animetosho.org/search?q=" + animetoshoq}>
                <FontAwesome name="link" /> Anime Tosho
              </a>
            }
            <span className="episodes">{episodes}</span>
            <span className="chapters">{chapters}</span>
          </div>
          <video ref={(i) => this.videoRef = i} className="video-player" controls poster="assets/logo-poster.png">
            {
              selectedEpisode != null && <source type="video/mp4" src={"http://onepace.net/streams/" + selectedEpisode.crc32 + ".mp4"} />
            }
          </video>
        </div>
      </Layout>
    );
  }
}
