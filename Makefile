BINARY     	:= bbpybootstrap-debug
TART       	:= blackberry-py/tart

include ./signing/bbpass

.PHONY: all clean deploy

all: $(BINARY)

$(BINARY): signing/debugtoken.bar
	blackberry-nativepackager -package $(BINARY).bar \
			-configuration Device-Debug \
			-devMode \
			-target bar \
			-env PYTHONPATH=app/native \
			-env PYTHONDONTWRITEBYTECODE=1 \
			-arg -qml -arg app/native/assets/main.qml \
			-arg app/native/blackberry_tart.py \
			bar-descriptor.xml \
			icon.png \
			app/ \
			assets/ \
			-C $(TART)/entry $(TART)/entry/TartStart \
			-C $(TART)/js $(TART)/js/*.js \
			-C $(TART)/python $(TART)/python \
			-debugToken signing/debugtoken.bar

signing/debugtoken.bar:
	$(error Debug token error: place debug token in signing/debugtoken.bar or see signing/Makefile))

clean:
	@rm -fv $(BINARY).bar

deploy: $(BINARY)
	blackberry-deploy -installApp $(BBIP) -password $(BBPASS) $(BINARY).bar

