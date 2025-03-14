$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$ytDlpPath = "$scriptPath\yt-dlp.exe"

function CommandExists {
    param ($command)
    return [bool](Get-Command $command -ErrorAction SilentlyContinue)
}

if (-Not (Test-Path $ytDlpPath)) {
    Write-Host "yt-dlp.exe não encontrado na pasta do script!" -ForegroundColor Red
    exit
}

if (-Not (CommandExists "ffmpeg")) {
    Write-Host "FFmpeg não está instalado. Ele é necessário para converter o áudio para MP3." -ForegroundColor Yellow
    $instalarFFmpeg = Read-Host "Deseja instalar o FFmpeg agora? (S/N)"
    
    if ($instalarFFmpeg -match "^[sS]$") {
        Write-Host "Instalando o FFmpeg..." -ForegroundColor Green
        winget install ffmpeg
        Write-Host "Instalação concluída! Reinicie o PowerShell e execute o script novamente." -ForegroundColor Green
        exit
    } else {
        Write-Host "O FFmpeg é necessário para converter o áudio. Saindo do programa." -ForegroundColor Red
        exit
    }
}

function BaixarMidia {
    while ($true) {
        $videoUrl = Read-Host "Cole o link do vídeo do YouTube"
        $tipoDownload = Read-Host "Digite [V] para vídeo MP4 ou [A] para baixar áudio MP3"

        if ($tipoDownload -match "^[vV]$") {
            Write-Host "Baixando vídeo..." -ForegroundColor Cyan            
            & $ytDlpPath -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" -o "$scriptPath\%(title)s.mp4" $videoUrl

            Write-Host "Download de vídeo concluído!" -ForegroundColor Green
        }
        elseif ($tipoDownload -match "^[aA]$") {
            Write-Host "Baixando áudio..." -ForegroundColor Cyan
            & $ytDlpPath -f "bestaudio" --extract-audio --audio-format mp3 --audio-quality 0 -o "$scriptPath\%(title)s.%(ext)s" $videoUrl
            Write-Host "Download de áudio concluído!" -ForegroundColor Green
        }
        else {
            Write-Host "Opção inválida! Escolha 'V' para vídeo ou 'A' para áudio." -ForegroundColor Red
            continue
        }

        $continuar = Read-Host "Deseja baixar outro arquivo? (S/N)"
        if ($continuar -notmatch "^[sS]$") {
            Write-Host "Saindo do programa. Até mais!" -ForegroundColor Cyan
            exit
        }
    }
}

BaixarMidia
