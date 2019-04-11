
targets = \
  tmp/token/valid-xsd/metamodel.xml \
  tmp/token/valid-sch/metamodel.xml \
  tmp/metamodel.png \

.PHONY: default
default: ${targets} xsd 

tmp/metamodel.png: metamodel.dot
	mkdir -p ${dir $@}
	dot -Tpng -o$@ $<

.PHONY: xsd
xsd:
	rm -rf tmp/xsd
	mkdir -p tmp/xsd
	saxon --in=metamodel.xml --xsl=generate-xsd.xsl

tmp.metamodel.sch.xsl: metamodel.sch functions.xsl
	schematron-compile --output-file=$@ $<

tmp/token/valid-sch/%: % tmp.metamodel.sch.xsl functions.xsl
	schematron-execute --xslt-file=tmp.metamodel.sch.xsl $<
	mkdir -p ${dir $@}
	touch $@

tmp/token/valid-xsd/%: %
	xs-validate -c xml-catalog.xml $<
	mkdir -p ${dir $@}
	touch $@

.PHONY: clean
clean:
	${RM} -rf tmp
	${RM} ${wildcard tmp.*}