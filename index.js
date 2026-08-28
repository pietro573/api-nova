// npm init
// npm i express
// npm i mysql2
// npm i bcrypt
// node index.js -> executa a API
// ​http://localhost:3000/cliente
const express = require("express")
const app = express()
const port = 3000
app.use(express.json())

const db = require("./db")

const bcrypt = require("bcrypt")
app.post("/cliente", async (req, res) => {
    try {
        const cliente = req.body
        const senhaCript = bcrypt.hashSync(cliente.senha, 10)
        cliente.senha = senhaCript

        // envio para o BD
        const resultado = await db.pool.query(
            `INSERT INTO cliente (
              nome, cpf, email, senha, celular
            ) VALUES ( ?, ?, ?, ?, ? )`,
            [cliente.nome, cliente.cpf,
             cliente.email, cliente.senha, cliente.celular]
        )
        res.status(201).json({
            mensagem: "Cliente cadastrado, ID = " + resultado[0].insertId
        })
    } catch (error) {
        res.status(500).json({erro: error.message})
    }
})


app.get("/cliente", async (req, res) => {
     try{
        const resultado = await db.pool.query(
            `SELECT nome, cpf, email, celular FROM cliente`
        )
        res.status(200).json(resultado[0])
    } catch(error){
        res.status(500).json({resposta: error.message})
    }  
})

// `SELECT nome, cpf, email, celular FROM cliente WHERE id = ?`, [id]







app.listen(port, () => {
    console.log("API rodando na porta " + port)
})

