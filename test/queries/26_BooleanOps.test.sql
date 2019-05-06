﻿-----------------------------------------------------------------------
-- Boolean operators
-----------------------------------------------------------------------

SELECT TRUE & tbool 't@2000-01-01';
SELECT TRUE & tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT TRUE & tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT TRUE & tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT FALSE & tbool 't@2000-01-01';
SELECT FALSE & tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT FALSE & tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT FALSE & tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT tbool 't@2000-01-01' & TRUE;
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' & TRUE;
SELECT tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' & TRUE;
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' & TRUE;

SELECT tbool 't@2000-01-01' & tbool 't@2000-01-01';
SELECT tbool 't@2000-01-01' & tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT tbool 't@2000-01-01' & tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT tbool 't@2000-01-01' & tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' & tbool 't@2000-01-01';
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' & tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' & tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' & tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' & tbool 't@2000-01-01';
SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' & tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' & tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' & tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' & tbool 't@2000-01-01';
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' & tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' & tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' & tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

-------------------------------------------------------------------------------

SELECT TRUE | tbool 't@2000-01-01';
SELECT TRUE | tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT TRUE | tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT TRUE | tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT tbool 't@2000-01-01' | TRUE;
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' | TRUE;
SELECT tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' | TRUE;
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' | TRUE;

SELECT tbool 't@2000-01-01' | tbool 't@2000-01-01';
SELECT tbool 't@2000-01-01' | tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT tbool 't@2000-01-01' | tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT tbool 't@2000-01-01' | tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' | tbool 't@2000-01-01';
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' | tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' | tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}' | tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' | tbool 't@2000-01-01';
SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' | tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' | tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT '[t@2000-01-01, f@2000-01-02, t@2000-01-03]' | tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' | tbool 't@2000-01-01';
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' | tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' | tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}' | tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

-------------------------------------------------------------------------------

SELECT ~ tbool 't@2000-01-01';
SELECT ~ tbool '{t@2000-01-01, f@2000-01-02, t@2000-01-03}';
SELECT ~ tbool '[t@2000-01-01, f@2000-01-02, t@2000-01-03]';
SELECT ~ tbool '{[t@2000-01-01, f@2000-01-02, t@2000-01-03],[t@2000-01-04, t@2000-01-05]}';

/*****************************************************************************/
