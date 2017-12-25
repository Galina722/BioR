library(shiny)
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    t=seq(0,10,0.1)
    y=sin(t)
    plot(t,y,type='l',xlab='time',ylab='Sine',col='blue')
    vbio <- c(23,28,33)
    dfmt<-'%Y%m%d'
    bd <- as.Date(input$dateob, dfmt)
    td <- as.Date(Sys.time())
    d <- c(td-28,td,td+28)
    dif<- as.numeric(td-bd)
    ndif<- seq(dif-28,dif+28,1)
    fbio1 <- sin(2*pi*ndif/vbio[1])
    fbio2 <- sin(2*pi*ndif/vbio[2])
    fbio3 <- sin(2*pi*ndif/vbio[3])
    fall<-fbio1+fbio2+fbio3 
    ifelse( 
      max(fall[1:29])>max(fall[30:57]),
      lgp<-'topright',
      lgp<-'topleft'
    )
    plot(ndif,fall,type='l',col='black',
         xlab='',ylab='',lwd=2,yaxt='n',xaxt='n',
         main='',axes=FALSE)
    box()
    axis(side=1,at=ndif[c(1,29,57)],labels=as.character(d,'%d-%b, %Y'))
    lines(ndif,fbio1,col='blue')
    lines(ndif,fbio2,col='magenta')
    lines(ndif,fbio3,col='green')
    abline(v=dif,col='red')
    
    legend(lgp,lty=1,
           legend=c('physical','emotional','intellect','overall'),
           col=c('blue','magenta','green','black'))
  })
})