# Aplicativo Flutter para Web e Dispositivos Móveis

## Visão Geral

Este projeto é um aplicativo Flutter que roda nas plataformas web, Android e iOS. Ele possui uma página de login na qual os usuários podem inserir suas credenciais e, após o login bem-sucedido, eles podem acessar uma página onde podem criar e salvar conteúdo em cartões. O conteúdo inserido persiste mesmo quando o usuário recarrega a página.

## Instalação e Uso

### Web

Para acessar o projeto na web, basta clicar no seguinte link: [Projeto na Web](https://brunosantoscosta.github.io/teste-target-web.github.io).

### Android e iOS

Para executar o projeto no Android e iOS, siga as etapas abaixo:

1. **Clonar o Projeto:**
   - Abra seu terminal ou prompt de comando.
   - Navegue até o diretório onde deseja clonar o projeto.
   - Execute o seguinte comando para clonar o repositório do projeto:
     ```bash
     git clone https://github.com/brunosantoscosta/teste-target.git
     ```

2. **Abrir o Projeto:**
   - Abra seu editor de código preferido (por exemplo, Visual Studio Code).

3. **Instalar as Dependências:**
   - Certifique-se de ter o Flutter instalado. Se ainda não o tiver, [instale o Flutter](https://flutter.dev/docs/get-started/install).
   - Abra um terminal no diretório do projeto e execute o seguinte comando para instalar as dependências do projeto:
     ```bash
     flutter pub get
     ```

4. **Executar o Projeto no Android:**
   - Conecte seu dispositivo Android ou inicie um emulador Android.
   - No diretório do projeto, execute o seguinte comando para compilar e executar o aplicativo no Android:
     ```bash
     flutter run
     ```

5. **Executar o Projeto no iOS:**
   - No macOS, você pode executar o projeto no iOS usando o Xcode. Certifique-se de ter o Xcode instalado.
   - Abra o diretório `ios` no projeto usando o Xcode.
   - Configure um simulador no Xcode e selecione-o como dispositivo de destino.
   - Compile e execute o projeto a partir do Xcode.

6. **Depuração:**
   - Você pode usar as ferramentas de depuração fornecidas pelo seu editor de código ou IDE para uma experiência de desenvolvimento mais eficiente.

## Dependências

Este projeto depende dos seguintes pacotes Flutter:

- `flutter_lints: ^2.0.0`
- `build_runner: ^2.3.3`
- `mobx_codegen: ^2.1.1`
- `mobx: ^2.2.1`
- `flutter_mobx: ^2.1.1`
- `shared_preferences: ^2.2.2`
- `url_launcher: ^6.1.14`
