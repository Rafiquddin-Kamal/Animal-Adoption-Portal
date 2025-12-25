import app from "./app.js";
import "./routes/auth.js";
import "./routes/animal.js";
import "./routes/post.js";
import "./routes/adoption.js";
import "./routes/admin.js";

app.listen(5000, () => {
  console.log("Server running on port 5000");
});