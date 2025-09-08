FILES = apresentacao_mostra_cientifica \
        apresentacao_revisao_bibliografica \
        documento_de_casos_de_uso_es1 \
        documento_requisitos_de_software_es1_ieee \
        modelo_anteprojeto_de_tcc \
        modelo_relatorio_de_ic \
        modelo_revisao_bibliografica_tcc

all: $(FILES:%=%.zip)

%.zip:
	if [ -d "$*" ]; then \
	    cd "$*" && zip -r -9 ../"$*.zip" . ; \
	else \
	    zip -9 "$*.zip" "$*" ; \
	fi

clean:
	rm -f *.zip
