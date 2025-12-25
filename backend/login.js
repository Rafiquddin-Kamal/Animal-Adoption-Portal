import app from './app.js';
import con from './db.js';

app.post("/login", (req, res) => {
   const q = "SELECT email, password FROM users WHERE email = ? AND password = ?;";
   const val = [
      req.body.password,
      req.body.email,
   ];
   con.query(q, [val], (err, data) => {
      if (err) return res.json(err);
   })
   console.log("entered")
})