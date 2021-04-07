*&---------------------------------------------------------------------*
*& Report ztest_abap_unit
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_abap_unit.

class lcl_main DEFINITION.

PUBLIC SECTION .

types :BEGIN OF ty_check,
       matnr type matnr,
       werks type werks_d,
       END OF ty_check.

Data : li_find type table of ty_check.
types : tt_mat type STANDARD TABLE OF ty_check.

methods : test_matnr_werks changing li_test TYPE tt_mat.

ENDCLASS.

class lcl_main IMPLEMENTATION.
method test_matnr_werks.

select matnr werks from marc into TABLE li_test.

ENDMETHOD.
endclass.

class lcl_test DEFINITION for testing RISK LEVEL HARMLESS.

PUBLIC SECTION .
METHODS : test_matnr_werks for testing.

ENDCLASS.

class lcl_test IMPLEMENTATION.

METHOD test_matnr_werks.

Data : o_cut type ref to lcl_main.
TYPES: BEGIN OF ty_check1 ,
       matnr type matnr,
       werks type werks_d,
       end of ty_check1.

Data: li_find type STANDARD TABLE OF ty_check1.
Data: li_test type STANDARD TABLE OF ty_check1.

create OBJECT o_cut.

o_cut->test_matnr_werks( changing li_test = li_find ).

DATA : lw type ty_check1.

lw-matnr = ' 1000'.
lw-werks = '2442'.
append lw to li_test.

*

cl_abap_unit_assert=>assert_equals( msg = 'Incorrect Data'
exp = li_find act = li_find ).

ENDMETHOD.
ENDCLASS.
