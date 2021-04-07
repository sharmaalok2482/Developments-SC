*"* use this source file for your ABAP unit test classes
*
*CLASS ltc_demo_aunit_test DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.
*
*  PUBLIC SECTION.
*
*    METHODS get_yrs_of_srvc_success FOR TESTING .
*    METHODS get_yrs_of_srvc_fail FOR TESTING.
*
*  PRIVATE SECTION.
*
*    CLASS-METHODS : class_setup.
*    CLASS-METHODS : class_teardown.
*
*    METHODS setup.
*    METHODS teardown.
*
*    DATA: mo_cut TYPE REF TO zkc_cl_utility.
*
*ENDCLASS.
*
*CLASS ltc_demo_aunit_test IMPLEMENTATION .
*
*  METHOD class_setup.
*
*  ENDMETHOD.
*
*  METHOD setup.
*
*    mo_cut = NEW #( ).
*
*  ENDMETHOD.
*
*  METHOD teardown.
*    CLEAR mo_cut.
*
*  ENDMETHOD.
*
*
*
*  METHOD class_teardown.
*
*
*
*  ENDMETHOD.
*
*  METHOD get_yrs_of_srvc_success.
*    DATA : lv_dateofhire TYPE sy-datum VALUE '20000101',
*           lv_yrs_srvc   TYPE dec10_2,
*           lv_msgtext    TYPE string.
*
*
*    CALL METHOD mo_cut->get_yrs_of_src
*      EXPORTING
*        iv_date_of_hire = lv_dateofhire
*      IMPORTING
*        ev_yrs_srvc     = lv_yrs_srvc
*        ev_msgtext      = lv_msgtext.
*
*    CALL METHOD cl_abap_unit_assert=>assert_equals
*      EXPORTING
*        act = lv_yrs_srvc
*        exp = round( val = ( sy-datum - lv_dateofhire ) / 365 dec = 1 ).
***      ignore_hash_sequence = ABAP_FALSE
***      tol                  =
***      msg                  =
***      level                = IF_ABAP_UNIT_CONSTANT=>SEVERITY-MEDIUM
***      quit                 = IF_ABAP_UNIT_CONSTANT=>QUIT-TEST
**    RECEIVING
**      assertion_failed     =
*    .
*
*
*
*
*
*
*  ENDMETHOD.
*  METHOD get_yrs_of_srvc_fail.
*
*      DATA : lv_dateofhire TYPE sy-datum VALUE '20000101',
*             lv_yrs_srvc   TYPE dec10_2,
*             lv_msgtext    TYPE string.
*
*      CALL METHOD mo_cut->get_yrs_of_src
*        EXPORTING
*          iv_date_of_hire = lv_dateofhire
*        IMPORTING
*          ev_yrs_srvc     = lv_yrs_srvc
*          ev_msgtext      = lv_msgtext.
*
*      CALL METHOD cl_abap_unit_assert=>assert_equals
*        EXPORTING
*          act = lv_yrs_srvc
*          exp = 'Date of Hire cannot be a future date . Please enter a valid hire date'.
***      ignore_hash_sequence = ABAP_FALSE
***      tol                  =
***      msg                  =
***      level                = IF_ABAP_UNIT_CONSTANT=>SEVERITY-MEDIUM
***      quit                 = IF_ABAP_UNIT_CONSTANT=>QUIT-TEST
**    RECEIVING
**      assertion_failed     =
*      .
*
*    ENDMETHOD.
*
**ENDMETHOD.
*
*ENDCLASS.
