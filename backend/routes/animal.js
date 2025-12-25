import app from "../app.js";
import con from "../db.js";

app.get("/animals", (req, res) => {
  con.query("SELECT * FROM animal", (err, data) => {
    if (err) return res.json(err);
    res.json(data);
  });
});