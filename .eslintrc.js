module.exports = {
  root: true,

  parser: '@typescript-eslint/parser',

  extends: [
    'airbnb-typescript',
    'plugin:css-modules/recommended',
    'prettier',
    'prettier/react',
  ],

  plugins: ['@typescript-eslint/eslint-plugin', 'css-modules', 'prettier', 'react-hooks', 'jest'],

  parserOptions: {
    sourceType: 'module',
    project: './tsconfig.json',
    tsconfigRootDir: __dirname,
  },

  globals: {
    __DEV__: true,
  },

  env: {
    browser: true,
    jest: true,
  },

  rules: {
    // Forbid the use of extraneous packages
    // https://github.com/benmosher/eslint-plugin-import/blob/master/docs/rules/no-extraneous-dependencies.md
    'import/no-extraneous-dependencies': ['error', { packageDir: '.' }],

    // Recommend not to leave any console.log in your code
    // Use console.error, console.warn and console.info instead
    // https://eslint.org/docs/rules/no-console
    'no-console': [
      'error',
      {
        allow: ['warn', 'error', 'info'],
      },
    ],

    // Allow only special identifiers
    // https://eslint.org/docs/rules/no-underscore-dangle
    'no-underscore-dangle': [
      'error',
      {
        allow: ['__typename', '__DEV__'],
      },
    ],

    // Prefer destructuring from arrays and objects
    // http://eslint.org/docs/rules/prefer-destructuring
    'prefer-destructuring': [
      'error',
      {
        VariableDeclarator: {
          array: false,
          object: true,
        },
        AssignmentExpression: {
          array: false,
          object: false,
        },
      },
      {
        enforceForRenamedProperties: false,
      },
    ],

    // Ensure <a> tags are valid
    // https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/anchor-is-valid.md
    'jsx-a11y/anchor-is-valid': [
      'error',
      {
        components: ['Link'],
        specialLink: ['to'],
        aspects: ['noHref', 'invalidHref', 'preferButton'],
      },
    ],

    // Allow .js files to use JSX syntax
    // https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-filename-extension.md
    'react/jsx-filename-extension': [1, { extensions: ['.ts', '.tsx'] }],

    // Functional and class components are equivalent from React’s point of view
    // https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/prefer-stateless-function.md
    'react/prefer-stateless-function': 'off',

    // ESLint plugin for prettier formatting
    // https://github.com/prettier/eslint-plugin-prettier
    'prettier/prettier': 'error',

    'react/forbid-prop-types': 'off',
    'react/destructuring-assignment': 'off',
    'react/jsx-props-no-spreading': 'off',
    'react/static-property-placement': 'off',

    'react-hooks/rules-of-hooks': 'error',
    'react-hooks/exhaustive-deps': 'warn',

    // Typescript checks prop-types
    'react/prop-types': 'off',

    // Cannot config .ts, .tsx resolution
    'import/no-unresolved': 'off',

    'import/extensions': [
      'error',
      {
        'tsx': 'never'
      }
    ],

    'import/no-webpack-loader-syntax': 'off',

    'no-unused-vars': 'off',
    '@typescript-eslint/no-unused-vars': 'off',
    // '@typescript-eslint/no-unused-vars': [
    //   'error',
    //   {
    //     vars: 'local',
    //     args: 'after-used',
    //     ignoreRestSiblings: false,
    //     argsIgnorePattern: '^_',
    //   },
    // ],

    // Type variables by Codegen can not be camelcase.
    'camelcase': 'off',
  },
};
