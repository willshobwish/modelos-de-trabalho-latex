# Modelos de Trabalhos Acadêmicos em LaTeX

Em tipo-de-modelo/config/commands.sty possui constantes como titulo, orietnador, cidade e entre outros.  

É necessário alterar essas constantes que será alterado em todo o projeto.

### Este modelo não está conforme as normas da Sociedade Brasileira de Computação

Modelo de Trabalho de Conclusão de Curso com base na ABNT da Faculdade de Ciência e Tecnologia "Júlio de Mesquita Filho" Unesp em LaTeX.  

Ultima atualização em outubro de 2021, verifique se houve alterações na apostila abaixo.  

Foi baseado nessa apostila disponibilizado pelo [site da biblioteca](https://www.fct.unesp.br/Home/Biblioteca/abnt/apostila_abnt_word_bpp_2021.pdf).  
Para mais informações de como normalizar e formatar em ABNT acesse a [biblioteca da FCT](https://www.fct.unesp.br/#!/biblioteca2340/normalizacao/abnt/).

## Compilação

Você pode **baixar** os arquivos ZIP abaixo e:
- **Compilar localmente** com uma distribuição TeX (TeX Live, MiKTeX, etc.).
- **Importar para o Overleaf** via “New Project → Upload Project” ou arrastar o ZIP diretamente.

### Compilação Local
```bash
# Descompacte o ZIP
unzip Modelo_de_anteprojeto_de_TCC.zip
cd Modelo_de_anteprojeto_de_TCC

# Compile (usando latexmk)
latexmk -C
latexmk -pdf main.tex
```

### Overleaf
1. Acesse o Overleaf.
2. Clique em **New Project → Upload Project**.
3. Faça upload de `Modelo_de_anteprojeto_de_TCC.zip`.
4. Aguarde a importação e clique em **Recompile**.

### Usando VSCode e LaTeX
Mais informações em [LaTeX-Workshop wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install)
1. Baixe essa extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) para o VSCode.
2. Instale o [MiKTeX](https://miktex.org/download). 
**Observação**: Durante a instalação do MiKTeX, altere a opção "Install missing packages on-the-fly" de "Ask me first" para "Yes". Essa configuração permite que o MiKTeX baixe e instale automaticamente, de forma imediata (on the fly), qualquer pacote LaTeX que esteja faltando no seu sistema mas que seja necessário para compilar seu projeto.
Se essa opção estiver em "Ask me first", o sistema vai interromper a compilação para perguntar se deve instalar cada pacote individualmente, o que pode ser inconveniente durante o uso.
![image](https://github.com/user-attachments/assets/ff91d365-74f7-4328-a7da-7ac78fc9c6e4)
4. Instale o [Strawberry Perl](https://strawberryperl.com).
5. Reinicie o computador para as variáveis do ambiente funcionarem.