# =========================================================
# Script: Inventario e Diagnostico Basico de Maquina
# Autor: Leonardo Picanco Queiroz Fontinele
# Descricao: Coleta informacoes essenciais da maquina para
#            suporte tecnico: nome, IP, espaco em disco,
#            memoria e status basico de rede.
# =========================================================

Write-Host "===== INVENTARIO DE MAQUINA =====" -ForegroundColor Cyan

# Nome da maquina e usuario logado
$nomeMaquina = $env:COMPUTERNAME
$usuarioAtual = $env:USERNAME
Write-Host "`nComputador: $nomeMaquina"
Write-Host "Usuario logado: $usuarioAtual"

# Sistema operacional
$so = Get-CimInstance Win32_OperatingSystem
Write-Host "`nSistema Operacional: $($so.Caption)"
Write-Host "Versao: $($so.Version)"
Write-Host "Arquitetura: $($so.OSArchitecture)"

# Endereco IP e adaptadores de rede ativos
Write-Host "`n--- Rede ---" -ForegroundColor Cyan
Get-NetIPConfiguration | Where-Object { $_.NetAdapter.Status -eq "Up" } | ForEach-Object {
    Write-Host "Adaptador: $($_.InterfaceAlias)"
    Write-Host "IP: $($_.IPv4Address.IPAddress)"
    Write-Host "Gateway: $($_.IPv4DefaultGateway.NextHop)"
    Write-Host "---"
}

# Espaco em disco
Write-Host "--- Discos ---" -ForegroundColor Cyan
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $livreGB = [math]::Round($_.FreeSpace / 1GB, 2)
    $totalGB = [math]::Round($_.Size / 1GB, 2)
    Write-Host "Unidade $($_.DeviceID) - Livre: $livreGB GB de $totalGB GB"
}

# Memoria RAM
Write-Host "`n--- Memoria RAM ---" -ForegroundColor Cyan
$memoriaTotalGB = [math]::Round($so.TotalVisibleMemorySize / 1MB, 2)
$memoriaLivreGB = [math]::Round($so.FreePhysicalMemory / 1MB, 2)
Write-Host "Total: $memoriaTotalGB GB"
Write-Host "Livre: $memoriaLivreGB GB"

# Teste rapido de conectividade
Write-Host "`n--- Teste de Conectividade ---" -ForegroundColor Cyan
$testeInternet = Test-Connection -ComputerName "8.8.8.8" -Count 2 -Quiet
if ($testeInternet) {
    Write-Host "Internet: OK" -ForegroundColor Green
} else {
    Write-Host "Internet: SEM CONEXAO" -ForegroundColor Red
}

Write-Host "`n===== FIM DO RELATORIO =====" -ForegroundColor Cyan

# Para exportar este relatorio para um arquivo de texto, execute:
# .\inventario-maquina.ps1 | Out-File "relatorio-$env:COMPUTERNAME.txt"
