import app from "../app.js";
import con from "../db.js";

app.post("/adopt", (req, res) => {
  con.query(
    "INSERT INTO adoption (u_id, animal_id, status) VALUES (?, ?, 'pending')",
    [req.body.u_id, req.body.animal_id],
    () => res.json({ message: "Adoption requested" })
  );
});