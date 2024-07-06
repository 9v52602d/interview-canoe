const request = require("supertest");
const app = require("../canoe-app");

describe("GET /current_time", () => {
  let expect;

  before(async () => {
    const chai = await import("chai");
    expect = chai.expect;
  });

  it("should return 200 at the index", (done) => {
    request(app)
      .get("/")
      .expect("Content-Type", "text/html; charset=utf-8")
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        done();
      });
  });

  it("should return 200 at the healthcheck", (done) => {
    request(app)
      .get("/hello_world")
      .expect("Content-Type", "text/html; charset=utf-8")
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        done();
      });
  });

  it("should return 200 at the healthcheck", (done) => {
    request(app)
      .get("/healthcheck")
      .expect("Content-Type", "application/json; charset=utf-8")
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        done();
      });
  });

  it("should return 200 and received query parameter", (done) => {
    request(app)
      .get("/current_time?name=Canoe-dev")
      .expect("Content-Type", "application/json; charset=utf-8")
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        done();
      });
  });
});
