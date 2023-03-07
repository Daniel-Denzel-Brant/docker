const express = require('express');
const app = express();

app.get('/status', (req,res)=>{
     res.send("Welcome!"); 
 });

app.listen(3000, function () {
    console.log("app listening on port 3000");
});