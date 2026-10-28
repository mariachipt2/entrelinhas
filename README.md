# Entrelinhas

Editor pessoal de conversas fictícias, estático e compatível com GitHub Pages. Interface em português, personagens, conversas, mensagens recebidas/enviadas, edição/exclusão, horário e modo print. Escreva diretamente no campo da conversa. Segure uma mensagem para escolher quem enviou, editar ou excluir. O botão + permite anexar JPG, PNG ou WebP de até 12 MB; o app reduz a imagem para até 1280 px antes de salvar. Imagens ficam junto das conversas no mesmo JSON protegido do Supabase, sem bucket adicional. Configure o horário e o remetente padrão em Configurações gerais. Use Salvar imagem para gerar PNGs da conversa completa, com fotos e detalhes, sem controles do editor. Conversas extensas são divididas em partes para respeitar os limites de memória dos celulares. O arquivo export.js deve ser publicado junto de app.js, index.html e style.css.

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

## Novas funções

- Reorganizar: ative o botão no telefone, arraste a mensagem e toque em Concluir. O histórico rola automaticamente ao arrastar perto das bordas. Também é possível usar as setas do teclado no modo de reorganização ou Subir/Descer nas opções de mensagem.
- Configurações gerais → Tema: claro ou escuro, aplicado à interface e à exportação.
- Configurações gerais → Detalhes: status Entregue/Lido, indicador de digitação e data inicial opcionais. O status é exibido se a última mensagem for sua.
- Segure uma mensagem para adicionar um separador de data antes dela.
- Salvar imagem: gera os arquivos localmente no navegador e disponibiliza os links para baixar. As imagens não são enviadas a serviços de exportação.

Atualizações: publique index.html, app.js, style.css e export.js. Preserve o config.js que já contém sua configuração. Não é necessário alterar a tabela SQL existente.

Envio: toque curto na seta envia com o remetente atual. Segure a seta por meio segundo para abrir a escolha de remetente; selecionar envia a mensagem. Cancelar mantém o rascunho. Sem mensagem, a escolha apenas define o remetente das próximas mensagens. Pelo teclado, a seta para cima no botão de envio abre o mesmo menu.

Interface: o site abre na lista de conversas. Toque em um contato para abrir o chat e use a seta para voltar. A engrenagem da lista abre as configurações; Aparência e preferências contém o tema claro/escuro. A interface ocupa a janela inteira, sem moldura de celular.


Inserir fala: segure uma mensagem e escolha Adicionar antes ou Adicionar depois. Digite no campo habitual e envie; a nova fala entra na posição escolhida. O aviso acima do campo permite cancelar a inserção sem apagar o rascunho. Também funciona com imagens e com a escolha de remetente ao segurar a seta.


Salvar tela atual captura o trecho visível e a rolagem, sem os controles de edição e sem barras nativas do navegador/sistema. A biblioteca html2canvas 1.4.1 está incluída em vendor com licença MIT. Publique a pasta vendor, manifest.webmanifest e icon-192.png / icon-512.png junto dos arquivos do app. Tela cheia exige gesto do usuário; use o botão na lista ou nas opções do chat. O manifesto solicita fullscreen ao abrir pelo atalho instalado, mas o suporte e a barra de status dependem do aparelho/navegador. Não há promessa de ocultar a barra nativa no iPhone.

