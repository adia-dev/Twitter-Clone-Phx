module.exports = {
  mode: "jit",
  purge: ["./js/**/*.js", "../lib/*_web/**/*.*ex"],
  theme: {
    extend: {
      gridColumn: {
        "span-16": "span 2 / span 1",
      },
      gridTemplateColumns: {
        twitter: "1fr 1fr 1fr",
      },
    },
  },
  variants: {},
  plugins: [],
};
