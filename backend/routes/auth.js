import app from "../app.js";
import con from "../db.js";

app.post("/signup", (req, res) => {
  const { name, email, password } = req.body;

  con.query(
    "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, false)",
    [name, email, password],
    (err) => {
      if (err) return res.json(err);
      res.json({ message: "Signup successful" });
    }
  );
});

app.post("/login", (req, res) => {
  const { email, password } = req.body;

  con.query(
    "SELECT * FROM users WHERE email=?",
    [email],
    (err, data) => {
      if (data.length === 0)
        return res.json({ message: "User not found" });

      if (data[0].password !== password)
        return res.json({ message: "Wrong password" });

      res.json({ user: data[0] });
    }
  );
});