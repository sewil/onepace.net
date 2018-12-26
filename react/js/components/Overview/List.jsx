import React from "react"
import Card from "./Card"
import { Glyphicon } from "react-bootstrap"

export default class List extends React.Component {
	render() {
		const isLoggedIn = this.props.user != null
		const isAdmin = isLoggedIn && this.props.user.role >= 4
		return (
			<div className="list">
				<div className={"header" + (!this.props.arc.released ? " unreleased" : "")}>{this.props.arc.title}</div>
				<div className={"cards" + (!this.props.arc.released ? " unreleased" : "")}>
					<Card img={this.props.image} />
					{this.props.cards.map(episode => {
						return <Card
							user={this.props.user}
							onView={()=>this.props.onClickCard(episode)}
							key={episode.id}
							episode={episode}
							arc={this.props.arc}
							onClick={() => this.props.onClickCard(episode)}
						/>
					})}
				</div>
				{
					isAdmin &&
					<div className="add-card-button-container">
						<div className="add-card-button" onClick={() => this.props.onAddCardButtonClick()}>
							<Glyphicon glyph="plus" />
							<div className="the-text">Add episode</div>
						</div>
					</div>
				}
			</div>
		)
	}
}
