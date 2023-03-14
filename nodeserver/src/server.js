const hostname = '0.0.0.0'

app.listen(3000, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});