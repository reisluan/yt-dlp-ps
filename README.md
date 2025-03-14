# YouTube Downloader (yt-dlp + PowerShell)

Este script em **PowerShell** permite baixar vídeos e áudios do YouTube utilizando o **yt-dlp**. Ele verifica automaticamente a presença do **FFmpeg**, necessário para conversões de áudio, e oferece a opção de instalação caso não esteja disponível.

## 🚀 Funcionalidades
- Baixa **vídeos em MP4**.
- Baixa **áudios e converte para MP3**.
- Verifica se **yt-dlp** e **FFmpeg** estão disponíveis.
- Instala automaticamente o **FFmpeg** se necessário (usando `winget`).
- Permite baixar múltiplos vídeos/áudios em sequência.

## 📋 Pré-requisitos
Antes de executar o script, certifique-se de que possui:
- Windows com **PowerShell**.
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) executável atualizado, baixado e salvo no mesmo diretório do script.
- [FFmpeg](https://ffmpeg.org/) instalado (o script também oferece a opção de instalação automática via Winget).
- [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) instalado (somente para instalação automática do FFmpeg).

## 📥 Instalação
1. **Baixe o script**
   ```sh
   git clone https://github.com/reisluan/yt-dlp-ps.git
   cd yt-dlp-ps
   ```
2. **Baixe o yt-dlp.exe**
   - Acesse [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases/latest).
   - Baixe o arquivo `yt-dlp.exe` e coloque na pasta do script.

## 🛠️ Como Usar
1. **Execute o script no PowerShell**
   ```sh
   .\down_yt.ps1
   ```
2. **Cole o link do vídeo** quando solicitado.
3. Escolha entre **[V] para vídeo MP4** ou **[A] para áudio MP3**.
4. O arquivo será baixado na pasta do script.
5. O script perguntará se deseja baixar outro arquivo.

## 📌 Exemplo de Uso
```
Cole o link do vídeo do YouTube: https://www.youtube.com/watch?v=exemplo
Digite [V] para vídeo MP4 ou [A] para baixar áudio MP3: A
Baixando áudio...
Download de áudio concluído!
Deseja baixar outro arquivo? (S/N): N
Saindo do programa. Até mais!
```

## ⚠️ Aviso Legal
Este script deve ser usado apenas para baixar conteúdos permitidos pelo YouTube e respeitando os termos de serviço da plataforma.

## 📝 Licença
Este projeto está licenciado sob a [MIT License](LICENSE).

