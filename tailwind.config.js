/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.cfm",
    "./Admin/*.cfm",
    "./Pemaju/*.cfm",
    "./Pembeli/*.cfm",
    "./Utama/**/*.cfm",
  ],
  theme: {
    extend: {
      backgroundImage: {
        'backgroundImage': "url('./public/assets/Background.jpg')",  // Custom background image
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',  // Custom radial gradient
        'gradient-conic': 'conic-gradient(var(--tw-gradient-stops))',  // Custom conic gradient
      },
    },
  },
  plugins: [],
}

