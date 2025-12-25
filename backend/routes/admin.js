import app from "../app.js";
import con from "../db.js";

app.post("/admin/deletepost", (req, res) => {
  const { u_id, animal_id } = req.body;

  con.query(
    "INSERT INTO delpost (u_id, animal_id, del_id) VALUES (?, ?, 1)",
    [u_id, animal_id]
  );

  con.query(
    "DELETE FROM posted WHERE u_id=? AND animal_id=?",
    [u_id, animal_id]
  );

  res.json({ message: "Post deleted by admin" });
});

app.post("/admin/deletecomment", (req, res) => {
  const { u_id, comment_id } = req.body;

  con.query(
    "INSERT INTO delcom (u_id, comment_id) VALUES (?, ?)",
    [u_id, comment_id]
  );

  con.query(
    "DELETE FROM comment WHERE comment_id=?",
    [comment_id]
  );

  res.json({ message: "Comment deleted by admin" });
});