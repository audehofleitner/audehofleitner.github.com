DOCS=index mm teaching CV outreach classes past_research publications talks teaching code_lasso code_traffic tr-b2012 t-its2012 cdc2012 itsc2012 cdc2011 itsc2011 acc2012 trb2012nmf trb2012stream trb2012prob aoas2013

HDOCS=$(addsuffix .html, $(DOCS))
#HDOCS=*.html
IMAGES=images/*
PAPERS=papers/*
POSTERS=posters/*
TALKS=talks/*
PHDOCS=$(HDOCS) $(IMAGES) $(PAPERS) $(POSTERS) $(TALKS)

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(HDOCS)
	@echo -n 'Copying to server...'
	scp $(HDOCS) eecs:~/public_html/
	@echo ' done.'
	

%.html : %.jemdoc MENU
	jemdoc -c mysite.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f *.html
