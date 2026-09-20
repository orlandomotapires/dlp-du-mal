# Configuração do ambiente: VHDL com Yosys + GHDL no Ubuntu

1. Instalação

```bash
# Baixar o OSS CAD Suite (linux-x64) em:
# https://github.com/YosysHQ/oss-cad-suite-build/releases
tar -xzf oss-cad-suite-linux-x64-*.tgz -C ~
sudo apt install graphviz xdot        # visualizador do comando "show"
```

O `apt` não tem o pacote `ghdl-yosys-plugin`. O OSS CAD Suite traz Yosys,
GHDL e o plugin GHDL para o Yosys.

## 2. Ativação

```bash
source ~/oss-cad-suite/environment
yosys -m ghdl -V                      # testa se o plugin carrega
```

## 3. Comandos de visualização (modelos)

Substitua `ARQUIVO` pelo nome do arquivo (sem extensão) e `ENTIDADE` pelo nome
da `entity` declarada no VHDL.

Regras:

- O arquivo precisa ter extensão **`.vhd`**.
- O nome depois de `-e` precisa ser o **nome da entity**, não o do arquivo.

```bash
# Estrutura fiel ao código (sem otimização)
yosys -m ghdl -p "ghdl ARQUIVO.vhd -e ENTIDADE; proc; show"

# Versão simplificada (após otimização)
yosys -m ghdl -p "ghdl ARQUIVO.vhd -e ENTIDADE; proc; opt; opt_clean; show"

# Salvar como PNG (por exemplo, para relatórios)
yosys -m ghdl -p "ghdl ARQUIVO.vhd -e ENTIDADE; proc; show -format png -prefix saida_original"
yosys -m ghdl -p "ghdl ARQUIVO.vhd -e ENTIDADE; proc; opt; opt_clean; show -format png -prefix saida_otimizada"
```

Observação: o TerosHDL também tem um Schematic Viewer próprio
(`Ctrl+Shift+P` → *TerosHDL: Open schematic viewer*), que usa Yosys por baixo.
