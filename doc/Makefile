
PNGDPI=300
PNGOPT=-d $(PNGDPI) -b '\#ffffff' -y 255

TARGET=big_sphere_manual.pdf
PAGES_SRC=big_sphere_assembly.svg segment_wiring_scaled_0.svg segment_wiring_scaled_1.svg
PAGES=$(patsubst %.svg, %.pdf, $(PAGES_SRC))
PAGES_PNG=$(patsubst %.svg, %.png, $(PAGES_SRC))

default: $(TARGET)

png: $(PAGES_PNG)

%.png: %.svg
	inkscape -o $@ $(PNGOPT) $<

%.pdf: %.svg
	inkscape -o $@ $<

$(TARGET): $(PAGES)
	pdftk $^ cat output $@

clean:
	-rm $(TARGET) $(PAGES) $(PAGES_PNG)
