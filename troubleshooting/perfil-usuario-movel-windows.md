# Perfil de Usuário Móvel (Roaming Profile) no Windows

## Problema

Usuário que faz login em diferentes computadores da rede reclama que suas configurações, documentos ou preferências não seguem entre as máquinas, ou o login demora muito para carregar o perfil, ou aparece erro de "perfil temporário" ao entrar no Windows.

## Diagnóstico

1. Verificar se a conta do usuário está configurada no Active Directory (ou servidor de domínio) para usar perfil móvel, apontando para um caminho de rede válido (ex: `\\servidor\perfis\usuario`).
2. Verificar se o computador consegue acessar esse caminho de rede — testar permissões de pasta compartilhada.
3. Verificar o tamanho do perfil — perfis muito grandes (com muitos arquivos na área de trabalho ou downloads) demoram para sincronizar no login/logoff.
4. Checar se o perfil está corrompido, o que geralmente gera o erro de "perfil temporário".

## Solução

- Se o caminho de rede estiver incorreto ou inacessível, corrigir a configuração de perfil na conta do usuário no servidor de domínio.
- Se o perfil estiver grande demais, orientar o usuário a mover arquivos pesados para uma pasta de rede/OneDrive em vez da área de trabalho local.
- Se o perfil estiver corrompido, renomear a pasta de perfil local (forçando a recriação) ou restaurar a partir do backup do perfil no servidor.
- Garantir que a política de grupo (GPO) relacionada a perfis móveis esteja aplicada corretamente à unidade organizacional do usuário.

## Comandos usados

```
whoami /all
gpresult /r
gpupdate /force
net use \\servidor\perfis\usuario
rundll32.exe sysdm.cpl,EditUserProfiles
```
