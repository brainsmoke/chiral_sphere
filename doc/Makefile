

TARGET=big_sphere_manual.pdf
PAGES=big_sphere_assembly.pdf segment_wiring_scaled_0.pdf segment_wiring_scaled_1.pdf

%.pdf: %.svg
	inkscape -o $@ $<

$(TARGET): $(PAGES)
	pdftk $^ cat output $@

clean:
	-rm $(TARGET) $(PAGES)
