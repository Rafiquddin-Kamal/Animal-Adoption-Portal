import app from "../app.js";
import con from "../db.js";
import multer from "multer";

const upload = multer({ storage: multer.memoryStorage() });

app.post("/post", upload.single("picture"), (req, res) => {
  const { u_id, animal_id, name, description } = req.body;

  con.query(
    `INSERT INTO posted
     (u_id, animal_id, name, description, vote_type, picture)
     VALUES (?, ?, ?, ?, false, ?)`,
    [u_id, animal_id, name, description, req.file.buffer],
    (err) => {
      if (err) return res.json(err);
      res.json({ message: "Post created" });
    }
  );
});

app.post("/upvote", (req, res) => {
  const { u_id, animal_id } = req.body;

  con.query(
    "UPDATE posted SET vote_type=true WHERE u_id=? AND animal_id=?",
    [u_id, animal_id],
    () => res.json({ message: "Upvoted" })
  );
});