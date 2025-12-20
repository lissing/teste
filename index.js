const express = require('express');
const ytdl = require('ytdl-core');
const path = require('path');
const app = express();

// Porta do servidor
const PORT = process.env.PORT || 3000;

// Serve o arquivo HTML principal
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Rota que o MTA vai ler
app.get('/stream', async (req, res) => {
    const videoUrl = req.query.url;

    if (!videoUrl) return res.status(400).send('URL faltando');

    try {
        res.setHeader('Content-Type', 'audio/mpeg');
        
        // Faz o streaming direto do YouTube para o rádio do MTA
        ytdl(videoUrl, {
            filter: 'audioonly',
            quality: 'highestaudio',
            format: 'mp3'
        }).on('error', (err) => {
            console.error('Erro no Stream:', err);
            res.end();
        }).pipe(res);

    } catch (e) {
        res.status(500).send('Erro ao processar áudio.');
    }
});

app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));