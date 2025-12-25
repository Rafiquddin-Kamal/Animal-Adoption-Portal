import app from './app.js';
import con from './db.js';

let del_id = 3;
let u_id = 3;

app.post("/", (req, res) => {
   const q = `INSERT INTO Users u_id, name, password, email, role, del_id VALUES (${u_id}, ?, ?, ?, 0, ${del_id});`;
   console.log("entered.");
   const val = [
      req.body.name,
      req.body.email,
      req.body.password,
   ];
   con.query(q, [values], (err, data) => {
      if (err) return res.json(err);
   })
})

del_id += 1;
u_id += 1;