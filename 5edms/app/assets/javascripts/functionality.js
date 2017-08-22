
    $(document).ready(function(){
		//following jquery is the functionality of previous experience

            $("#pcompanydetails").hide();
            $("#designation").hide();
            $("#skills").hide();
            $('#expyear').change(function(){
                var opt=$('#expyear').val();
                if(opt>0){
                    $("#pcompanydetails").slideDown(1000);
                    $("#designation").slideDown(1200);
                    $("#skills").slideDown(1400);

                }else if(opt==0){
                    $("#skills").slideDown(1000);
                    $("#pcompanydetails").hide(1000);
                    $("#designation").hide(1200);
                }
                else{
                    $("#pcompanydetails").hide();
                    $("#designation").hide();
                    $("#skills").hide();
                }
            });
		
		//qualifications scripts
		$('#pg').hide();
		$('#ug').hide();
		$('#diploma').hide();
		$('#class12').hide();
		$('#class10').hide();
		
		$('#hquali').change(function(){
			var opt=$('#hquali').val();
			alert(opt);
			if(opt=='pg'){
					$('#pg').slideDown(1000);
					$('#ug').slideDown(1200);
					$('#diploma').slideDown(1300);
					$('#class12').slideDown(1400);
					$('#class10').slideDown(1500);
			}else if(opt=='ug'){
				    $('#pg').hide(1500);
					$('#ug').slideDown(1200);
					$('#diploma').slideDown(1300);
					$('#class12').slideDown(1400);
					$('#class10').slideDown(1500);
			}else {
					$('#pg').hide();
					$('#ug').hide();
					$('#diploma').hide();
					$('#class12').hide();
					$('#class10').hide();
			}
		 });
		
       });

 $(document).ready(function() {
			// normal validations
            $('#defaultForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    first_name: {
                        validators: {
                            stringLength: {
                                min: 4,
                            },
                            notEmpty: {
                                message: 'Please supply your first name'
                            }
                        }
                    },
              
                    last_name: {
                        validators: {
                            stringLength: {
                                min: 4,
                            },
                            notEmpty: {
                                message: 'Please supply your last name'
                            }
                        }
                    },
                    doj: {
                        validators: {
                            date: {
                                format: 'DD/MM/YYYY',
                                message: ' ex :DD/MM/YYYY should match like example'
                            },
                            notEmpty: {
                                message: 'Please supply your D.O.J'
                            }
                        }
                    },
					dob: {
                        validators: {
                            date: {
                                format: 'DD/MM/YYYY',
                                message: ' ex :DD/MM/YYYY should match like example'
                            },
                            notEmpty: {
                                message: 'Please supply your D.O.B'
                            }
                        }
                    },
                    title: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply Title'
                            }
                        }
                    },
                    gender:{
                        validators:{
                            notEmpty:{
                                message:'select your gender'
                            }
                        }
                    },
                    martial:{
                        validators:{
                            notEmpty:{
                                message:'select the matrtial status'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply your email address'
                            },
                            emailAddress: {
                                message: 'Please supply a valid email address'
                            }
                        }
                    },
                    contact: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply your phone number'
                            },
                            regexp: {
                                regexp: /^[789]\d{9}$/,
                                message:'not a valid phone number or not a indian phone no '
                            }
                        }
                    },
                    employee_id:{
                        validators:{
                            notEmpty:{
                                message:'please supply employee id'
                            }
                        }
                    },
                    pan:{
                        validators:{
                            notEmpty:{
                                message:' please supply P.A.N no'
                            }
                        }
                    },
                    pf:{
                        validators:{
                            notEmpty:{
                                message:' please suppply your P.F no'
                            }
                        }
                    },
                    official_id:{
                        validators:{
                            notEmpty:{
                                message:' please suppply officail  mail id'
                            },
                            emailAddress: {
                                message: 'Please supply a valid email address'
                            }
                        }
                    },
                    Approval_mail:{
                        validators:{
                            notEmpty:{
                                message:' please suppply leave Appovals  mail id'
                            },
                            emailAddress: {
                                message: 'Please supply a valid email address'
                            }
                        }
                    },
                    office_contact:{
                        validators:{
                            notEmpty: {
                                message: 'Please supply your oofice contact'
                            },
                            regexp:{
                                regexp: /^[789]\d{9}$/,
                                message:'not a valid phone number or not a indian phone no'
                            }
                        }
                    },

                    address: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please supply your street address'
                            }
                        }
                    },
                    /*city: {
                     validators: {
                     stringLength: {
                     min: 4,
                     },
                     notEmpty: {
                     message: 'Please supply your city'
                     }
                     }
                     },
                     state: {
                     validators: {
                     notEmpty: {
                     message: 'Please select your state'
                     }
                     }
                     },*/

                    /* zip: {
                     validators: {
                     notEmpty: {
                     message: 'Please supply your zip code'
                     },
                     zipCode: {
                     country: 'IND',
                     message: 'Please supply a vaild zip code'
                     }
                     }
                     },*/
                    comment: {
                        validators: {
                            stringLength: {
                                min: 10,
                                max: 200,
                                message:'Please enter at least 10 characters and no more than 200'
                            },
                            notEmpty: {
                                message: 'Please supply a description of your project'
                            }
                        }
                    }
                }
            });
               
			//personal validations
			  $('#Personal').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    father_name: {
                        validators: {
                            stringLength: {
                                min: 4,
                            },
                            notEmpty: {
                                message: 'Please supply your Father name'
                            }
                        }
                    },
              
                    mother_name: {
                        validators: {
                            stringLength: {
                                min: 4,
                            },
                            notEmpty: {
                                message: 'Please supply your Mother name'
                            }
                        }
                    },
                    doa: {
                        validators: {
                            date: {
                                format: 'DD/MM/YYYY',
                                message: ' ex :DD/MM/YYYY should match like example'
                            },
                            notEmpty: {
                                message: 'Please supply your Date Aniversary'
                            }
                        }
                    },
                    econtact: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply your emergency number'
                            },
                            regexp: {
                                regexp: /^[789]\d{9}$/,
                                message:'not a valid phone number or not a indian phone no '
                            }
                        }
                    },
					econtactp: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply your emergency person number'
                            },
                            regexp: {
                                regexp: /^[789]\d{9}$/,
                                message:'not a valid phone number or not a indian phone no '
                            }
                        }
                    },
                    passport:{
                        validators:{
                            notEmpty:{
                                message:'please supply ur passport'
                            }
                        }
                    },
                    linkedin:{
                        validators:{
                            notEmpty:{
                                message:' please supply ur linkedin'
                            }
                        }
                    },
                    facebook:{
                        validators:{
                            notEmpty:{
                                message:' please suppply your facebook '
                            }
                        }
                    },
					twitter:{
                        validators:{
                            notEmpty:{
                                message:' please suppply your twitter '
                            }
                        }
                    },
					relationship:{
                        validators:{
                            notEmpty:{
                                message:' please suppply your relationship '
                            }
                        }
                    },
					blood_group:{
                        validators:{
                            notEmpty:{
                                message:' please suppply your blood group'
                            }
                        }
                    },
                    local_addr: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please supply your local address'
                            }
                        }
                    },
					 paddr: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please supply your permanent address'
                            }
                        }
                    },  
                }
           });
			
			//This validations is for previous experience
			 $('#Previous').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    expyears:{
                        validators:{
                            integer:{
                                message:'Insert a number like 0 0r above'
                            }
                        }
                    },
                    pcompanydetails:{
                        validators:{
                            notEmpty:{
                                message:' please enter previous company details'
                            }
                        }
                    },					
					 skills: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter skills'
                            }
                        }
                    },  
                }
           });
	 	 $('#qualification').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    pgbranch:{
                        validators:{
                            notEmpty:{
                                message:'please supply your pg branch'
                            }
                        }
                    },
                    pgyear:{
                        validators:{
                            notEmpty:{
                                message:' please supply P.G year'
                            }
                        }
                    },					
					 pgscore: {
                        validators: {
                            notEmpty: {
                                message: 'P.G score'
                            }
                        }
                    },
					 ugbranch: {
                        validators: {
                            notEmpty: {
                                message: 'U.G branch'
                            }
                        }
                    },
					 ugyear: {
                        validators: {
                            notEmpty: {
                                message: 'U.G year'
                            }
                        }
                    },
					 ugscore: {
                        validators: {
                            notEmpty: {
                                message: 'U.G score'
                      
                            }
                        }
                    },
					 class10: {
                        validators: {
                            notEmpty: {
                                message: 'please supply your board'
                      
                            }
                        }
                    },
					 year10: {
                        validators: {
                            notEmpty: {
                                message: 'passed out year'
                      
                            }
                        }
                    },
					 score10: {
                        validators: {
                            notEmpty: {
                                message: 'no you scored'
                      
                            }
                        }
                    }
                }
           });
	 
	      //This is the validations for apply leave
	      	 	 $('#leaveform').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    leave_type:{
                        validators:{
                            notEmpty:{
                                message:'select your leave type'
                            }
                        }
                    },
                    startdate:{
                        validators:{
						   date: {
                                format: 'DD/MM/YYYY',
                                message: ' ex :DD/MM/YYYY should match like example'
                            },
                            notEmpty:{
                                message:' choose date'
                            }
                        }
                    },					
					 todate: {
                        validators: {
							date:{
								format: 'DD/MM/YYYY',
                                message: ' ex :DD/MM/YYYY should match like example'
							},
                            notEmpty: {
                                message: 'P.G score'
                            }
                        }
                    },
					 days: {
                        validators: {
							Number:{
							 message:'should be a number'	
							},
                            notEmpty: {
                                message: 'enter data and should be no'
                            }
                        }
                    },
					reason:{
						validators:{
							 stringLength: {
                                min: 4,
                            },
                            notEmpty: {
                                message: 'Please supply your last name'
                            }
						}
					}
					
                }
           });
	 
	 
        });
