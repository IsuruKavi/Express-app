const express = require("express");
const { Client } = require("pg");

const app = express();
const port = 8080;

const client = new Client({
    user: "postgres",
    host: "localhost",
    database: "postgres",
    password: '',
    port: 5432 // Default PostgreSQL port
});

async function getUsers() {
    try {
        await client.connect();
        const result = await client.query("SELECT * FROM users");
        return result.rows;
    } catch (err) {
        console.error("Error fetching users:", err);
        return [];
    } finally {
        await client.end();
    }
}

app.get("/", async (req, res) => {
    try {
        const users = await getUsers();
        res.json(users);
    } catch (err) {
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
