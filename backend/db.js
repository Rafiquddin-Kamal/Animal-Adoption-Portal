import mysql from "mysql";

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "AnimalAdoptionPortal"
});

con.connect(err => {
  if (err) throw err;
  console.log('MySQL Connected');  //for debugging
});

export default con;