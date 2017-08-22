	$(document).ready(function(){
					//This is for msg button
					$('.alert-success').hide();
					$('.alert-warning').hide();
					$('.alert-danger').hide();
					
				// This is for view button
					$('#view').hide();
				//This is view result actions
					$('#protocol').hide();
					$('#hostname').hide();
					$('#portname').hide();
					$('#path').hide();
					$('#search').hide();
					$('#hash').hide();
					var parser =null;
					var domain =null;
					var hostName =null;
					var url=null;
					parser= document.createElement('a');
					$("#parseit").click(function(){
						      domain=$("#inputdomain").val();
						      url=$("#inputurl").val();
						      if(domain!='' && url!=''){
								parser.href=url;
								//getting value 
								 var pprotocol=parser.protocol;
								 var phostname=parser.hostname;
								 var pport=parser.port;
								 var ppathname=parser.pathname;
								 var psearch=parser.search;
								 var phash=parser.hash;
								 var porgin=parser.origin;
								 // This is for the special parsing
								 var subdirectory=null;
								 var subdomain=null;
								
								console.log('protocol name: '+parser.protocol); // => "http:"
								console.log('host name: '+parser.hostname); // => "example.com"
								console.log('port name: '+parser.port);     // => "3000"
								console.log('pathname name: '+parser.pathname); // => "/pathname/"
								console.log('search string: '+parser.search);   // => "?search=test"
								console.log('hash used:',parser.hash);     // => "#hash" 
							    console.log('host:'+parser.host);
								console.log('host:'+parser.origin);
								  
							    //This is checking for hostname having www or not
						        if(parser.hostname.indexOf("www")==0){
									//console.log("present");
								    //now checking for Domain has the www or not
									  if(domain.indexOf("www.")<0){
										 domain="www.".concat(domain);
										 if(domain==parser.hostname){
											$('.alert-warning').slideDown(900).hide(2000);
											$('.alert-success').slideDown(1000).hide(2500);
											$('.alert-danger').hide(1200);
											$('#view').slideDown(3500,function(){
											     $("#view").addClass('animated shake');
												 $("#view").click(function(){
													 //Show Protocol
													 if(pprotocol!=""){
														   $("#protocol").show(1000).addClass('animated bounceInDown');
														   $("#protocol-value").text(parser.protocol);
													 }
													 //show host name
													  if(phostname!=""){
														   $("#hostname").show(1500).addClass('animated bounceInDown');
														   $("#hostname-value").text(parser.hostname);
													 }
													 //show for portname
													  if(pport!=""){
														   $("#portname").show(2000).addClass('animated bounceInDown');
														   $("#port-value").text(parser.port);
														   
													 }
													 //for path name
													  if(ppathname!=""){
														   $("#path").show(2500).addClass('animated bounceInDown');
														   $("#path-value").text(parser.pathname);
														  	//This is returning array
														    console.log("This is for subdirectory");
														    subdirectory=ppathname.split('/');
														    for(var i=0;i<subdirectory.length;i++){
																console.log(subdirectory[i]+"\n");
															}
														  
													 }
													  if(psearch!=""){
														   $("#search").show(3000).addClass('animated bounceInDown');
														   $("#searching-value").text(parser.search);
													 }
													 //for hash 
													  if(phash!=""){
														   $("#hash").show(3500).addClass('animated bounceInDown');
														   $("#hash-value").text(parser.hash);
													 }
												 }); 
											
												
											});
										 }else{
											$('.alert-danger').slideDown(1000);
											$('.alert-success').hide(1200);
										}
									 }else{
										 if(domain==parser.hostname){
											$('#view').slideDown(1400);
											$('.alert-success').slideDown(1000);
											$('.alert-danger').hide(1200);
										    $('#view').slideDown(1200,function(){
											     $("#view").addClass('animated shake');
												 $("#view").click(function(){
													 //Show Protocol
													 if(pprotocol!=""){
														   $("#protocol").show(1000).addClass('animated bounceInDown');
														   $("#protocol-value").text(parser.protocol);
													 }
													 //show host name
													  if(phostname!=""){
														   $("#hostname").show(1500).addClass('animated bounceInDown');
														   $("#hostname-value").text(parser.hostname);
													 }
													 //show for portname
													  if(pport!=""){
														   $("#portname").show(2000).addClass('animated bounceInDown');
														   $("#port-value").text(parser.port);
														   
													 }
													 //for path name
													  if(ppathname!=""){
														   $("#path").show(2500).addClass('animated bounceInDown');
														   $("#path-value").text(parser.pathname);
														  console.log("This is for subdirectory");
														    subdirectory=ppathname.split('/');
														    for(var i=0;i<subdirectory.length;i++){
																console.log(subdirectory[i]+"\n");
															}
													
														    
													 }
													  if(psearch!=""){
														   $("#search").show(3000).addClass('animated bounceInDown');
														   $("#searching-value").text(parser.search);
													 }
													 //for hash 
													  if(phash!=""){
														   $("#hash").show(3500).addClass('animated bounceInDown');
														   $("#hash-value").text(parser.hash);
													 }
												 }); 
											
												
											});

										 }else{
											$('.alert-danger').slideDown(1000);
											$('.alert-success').hide(1200);
										}
									 }
                                  }
						        else{
									 //This function calculate main domain while
									 //get hostname
									var callhostname=function getHostName(url) {
										var match = url.match(/:\/\/(www[0-9]?\.)?(.[^/:]+)/i);
										if (match != null && match.length > 2 && typeof match[2] === 'string' && match[2].length > 0) {
										return match[2];
										}
										else {
											return null;
										}
									  }
									  var calldomain= function getDomain() {
											var hostName = callhostname(url);
											var domain = hostName;
											if (hostName != null) {
											  var parts = hostName.split('.').reverse();
												if (parts != null && parts.length > 1) {
													 domain = parts[1] + '.' + parts[0];
												  if(hostName.toLowerCase().indexOf('.co.uk') != -1 && parts.length > 2) {
													  domain = parts[2] + '.' + domain;
												  }
										         }
											   console.log("This is subdomain\n");
												for(var i=2;i<parts.length;i++){
													console.log(parts[i]);
												}
									}

								    return domain;
								  }
								  callhostname(porgin);
								 var cdomain=calldomain();
									
									 if(domain==cdomain){
										    $('#view').slideDown(1400);
											$('.alert-success').slideDown(1000);
											$('.alert-danger').hide(1200);
										    $('#view').slideDown(1200,function(){
											     $("#view").addClass('animated shake');
												 $("#view").click(function(){
													 //Show Protocol
													 if(pprotocol!=""){
														   $("#protocol").show(1000).addClass('animated bounceInDown');
														   $("#protocol-value").text(parser.protocol);
													 }
													 //show host name
													  if(phostname!=""){
														   $("#hostname").show(1500).addClass('animated bounceInDown');
														   $("#hostname-value").text(parser.hostname);
													 }
													 //show for portname
													  if(pport!=""){
														   $("#portname").show(2000).addClass('animated bounceInDown');
														   $("#port-value").text(parser.port);
														   
													 }
													 //for path name
													  if(ppathname!=""){
														   $("#path").show(2500).addClass('animated bounceInDown');
														   $("#path-value").text(parser.pathname);
														    console.log("This is for subdirectory");
														    subdirectory=ppathname.split('/');
														    for(var i=0;i<subdirectory.length;i++){
																console.log(subdirectory[i]+"\n");
															}
														   
													 }
													  if(psearch!=""){
														   $("#search").show(3000).addClass('animated bounceInDown');
														   $("#searching-value").text(parser.search);
													 }
													 //for hash 
													  if(phash!=""){
														   $("#hash").show(3500).addClass('animated bounceInDown');
														   $("#hash-value").text(parser.hash);
													 }
												 }); 
											});

										 }else{
											$('.alert-danger').slideDown(1000);
											$('.alert-success').hide(1200);
									 }
								}
						 }else{
							 alert("Domain  or Url  seems empty");
						 }
					});
			
				  });	
				