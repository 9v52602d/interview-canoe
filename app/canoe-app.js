// Define dependencies
const express = require("express");
const middleware = require("body-parser");
const winston = require("winston");
const expressWinston = require("express-winston");

const app = express();
const port = 3000;

// Define middleware
app.use(middleware.json());
app.use(middleware.urlencoded({ extended: true }));

// Setup Logs
const logger = winston.createLogger({
  level: "info",
  format: winston.format.json(),
  transports: [new winston.transports.Console()],
});
app.use(
  expressWinston.logger({
    winstonInstance: logger,
    meta: true,
    msg: "HTTP {{req.method}} {{req.url}}",
    expressFormat: true,
    colorize: false,
    ignoreRoute: function (req, res) {
      return false;
    },
  }),
);

// Define endpoints
app.get("/", (req, res) => {
  console.log(req);
  res.status(200).send("Home");
});

app.get("/hello_world", (req, res) => {
  console.log(req);
  res.status(200).send("Hello World Canoe!");
});

app.get("/current_time", (req, res) => {
  console.log(req);
  res.setHeader("Content-Type", "application/json");
  res
    .status(200)
    .send({ timestampt: Date.now(), message: "Hello " + req.query.name });
});

app.get("/healthcheck", (req, res) => {
  console.log(req);
  res.setHeader("Content-Type", "application/json");
  res.status(200).send({ status: "ok" });
});

// Start Server
if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
  });
}

// Export for tests
module.exports = app;
