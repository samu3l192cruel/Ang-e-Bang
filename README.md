# Angebang

Projeto de jogo criado no **GameMaker**.

## Estrutura

Este repositório contém:
- Arquivos de projeto do GameMaker (`.yyp`, `.yy`, `.gml`, etc.);
- Recursos do jogo (sprites, sons, salas, objetos);
- Arquivos de configuração de build para diferentes plataformas.

## Como abrir o projeto

1. Abra o GameMaker na sua máquina.
2. Vá em **File → Open**.
3. Selecione o arquivo `angebang.yyp` nesta pasta.

## Como versionar com Git e enviar para o GitHub

No seu computador (fora do Cursor), dentro desta pasta do projeto:

1. Inicialize o repositório:
   ```bash
   git init
   ```
2. Adicione todos os arquivos:
   ```bash
   git add .
   ```
3. Crie o primeiro commit:
   ```bash
   git commit -m "Primeiro commit do projeto Angebang"
   ```
4. No GitHub, crie um repositório vazio (sem README, sem .gitignore).
5. Conecte o repositório local ao GitHub (troque `SEU_USUARIO` e `NOME_DO_REPO`):
   ```bash
   git remote add origin https://github.com/SEU_USUARIO/NOME_DO_REPO.git
   git branch -M main
   git push -u origin main
   ```

Depois disso, sempre que fizer alterações:

```bash
git add .
git commit -m "Mensagem do commit"
git push
```

