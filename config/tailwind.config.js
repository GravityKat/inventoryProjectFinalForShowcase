/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
    "./node_modules/flowbite/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        "baby-blue": "#D6E8F0",
        "dark-blue": "#2F597B",
        "light-gray": "#F5F2EC",
        "bright-blue": "#36A9E0",
      },
    },
  },
  // plugins: [require("flowbite/plugin")],
};
