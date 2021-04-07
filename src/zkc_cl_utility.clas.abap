class ZKC_CL_UTILITY definition
  public
  final
  create public
  for testing .

public section.

  methods GET_YRS_OF_SRC
    importing
      !IV_DATE_OF_HIRE type SY-DATUM
    exporting
      !EV_YRS_SRVC type DEC10_2
      !EV_MSGTEXT type STRING .
protected section.
private section.
ENDCLASS.



CLASS ZKC_CL_UTILITY IMPLEMENTATION.


  METHOD get_yrs_of_src.

    IF iv_date_of_hire GT sy-datum.

       Message e002(Zdemo) into ev_msgtext.

       else.

         ev_yrs_srvc = ( sy-datum - iv_date_of_hire ) / 365.
         ev_yrs_srvc = round( val = ev_yrs_srvc dec = 1 ).

    ENDIF.
  ENDMETHOD.
ENDCLASS.
