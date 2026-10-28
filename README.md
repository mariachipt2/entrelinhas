# Entrelinhas

Editor pessoal de conversas fictícias, estático e compatível com GitHub Pages. Interface em português, personagens, conversas, mensagens recebidas/enviadas, edição/exclusão, horário e modo print. Fotos e exportação automática como imagem ainda não estão implementadas; use captura de tela no modo print.

## Experimentar

Sirva esta pasta com um servidor HTTP local (ex.: `npx --yes http-server .`). Sem configurar o Supabase, o app salva apenas neste navegador. Não existe sincronização entre dispositivos no modo local.

## Supabase — configurar uma única usuária

1. Crie seu projeto Supabase e execute `supabase.sql` no SQL Editor uma vez.
2. Em Authentication → Users, crie sua usuária com e-mail e senha e confirmação de e-mail. Em Authentication → Providers → Email, desative novos cadastros. Não há cadastro na interface.
3. Preencha `config.js` com a Project URL e a chave pública publishable (ou anon). Nunca use service_role ou chave secret: o arquivo será público no GitHub.
4. Abra o site e entre na sua conta. Os acessos à tabela são protegidos por RLS com auth.uid(). Nome dos personagens e conversas ficam no campo JSON payload, dentro de um registro exclusivo da conta.
5. No outro dispositivo, configure o mesmo site e entre com a mesma conta.

Cada salvamento envia o espaço completo. Evite editar simultaneamente em duas abas/dispositivos: a última gravação prevalece. Reabra a página antes de trocar de dispositivo para carregar a versão da nuvem. Falhas de nuvem aparecem na interface; a cópia local é preservada e há botão para tentar salvar novamente. Os dados locais não são criptografados. Sair limpa a cópia local do navegador.

## Publicar no GitHub Pages

1. Crie um repositório e envie os arquivos desta pasta na raiz.
2. Settings → Pages → Deploy from a branch → main → / (root) → Save.
3. Acesse a URL informada pelo GitHub. Os caminhos são relativos e funcionam em subpastas de repositórios.

O site é público; as conversas na nuvem exigem autenticação.

## Estado de validação

Conexão real e políticas precisam ser verificadas após configurar seu projeto Supabase. Não foram fornecidas credenciais nesta conversa.
