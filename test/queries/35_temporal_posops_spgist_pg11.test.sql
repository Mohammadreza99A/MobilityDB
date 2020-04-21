﻿-------------------------------------------------------------------------------

DROP INDEX IF EXISTS tbl_tbool_spgist_idx;
DROP INDEX IF EXISTS tbl_tint_spgist_idx;
DROP INDEX IF EXISTS tbl_tfloat_spgist_idx;
DROP INDEX IF EXISTS tbl_ttext_spgist_idx;

-------------------------------------------------------------------------------

ALTER TABLE test_relativeposops ADD spgistidx bigint ;

-------------------------------------------------------------------------------

CREATE INDEX tbl_tbool_spgist_idx ON tbl_tbool USING SPGIST(temp);
CREATE INDEX tbl_tint_spgist_idx ON tbl_tint USING SPGIST(temp);
CREATE INDEX tbl_tfloat_spgist_idx ON tbl_tfloat USING SPGIST(temp);
CREATE INDEX tbl_ttext_spgist_idx ON tbl_ttext USING SPGIST(temp);

-------------------------------------------------------------------------------
-- Left
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tint WHERE i << temp )
WHERE op = '<<' and leftarg = 'int' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tfloat WHERE i << temp )
WHERE op = '<<' and leftarg = 'int' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tint WHERE f << temp )
WHERE op = '<<' and leftarg = 'float' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tfloat WHERE f << temp )
WHERE op = '<<' and leftarg = 'float' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_intrange, tbl_tint WHERE i << temp )
WHERE op = '<<' and leftarg = 'intrange' and rightarg = 'tint';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE f << temp )
WHERE op = '<<' and leftarg = 'floatrange' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b << temp )
WHERE op = '<<' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b << temp )
WHERE op = '<<' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_int WHERE temp << i )
WHERE op = '<<' and leftarg = 'tint' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_float WHERE temp << f )
WHERE op = '<<' and leftarg = 'tint' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_intrange WHERE temp << i )
WHERE op = '<<' and leftarg = 'tint' and rightarg = 'intrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp << b )
WHERE op = '<<' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp << t2.temp )
WHERE op = '<<' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp << t2.temp )
WHERE op = '<<' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_int WHERE temp << i )
WHERE op = '<<' and leftarg = 'tfloat' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_float WHERE temp << f )
WHERE op = '<<' and leftarg = 'tfloat' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE temp << f )
WHERE op = '<<' and leftarg = 'tfloat' and rightarg = 'floatrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp << b )
WHERE op = '<<' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp << t2.temp )
WHERE op = '<<' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp << t2.temp )
WHERE op = '<<' and leftarg = 'tfloat' and rightarg = 'tfloat';

-------------------------------------------------------------------------------
-- Overleft
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tint WHERE i &< temp )
WHERE op = '&<' and leftarg = 'int' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tfloat WHERE i &< temp )
WHERE op = '&<' and leftarg = 'int' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tint WHERE f &< temp )
WHERE op = '&<' and leftarg = 'float' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tfloat WHERE f &< temp )
WHERE op = '&<' and leftarg = 'float' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_intrange, tbl_tint WHERE i &< temp )
WHERE op = '&<' and leftarg = 'intrange' and rightarg = 'tint';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE f &< temp )
WHERE op = '&<' and leftarg = 'floatrange' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b &< temp )
WHERE op = '&<' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b &< temp )
WHERE op = '&<' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_int WHERE temp &< i )
WHERE op = '&<' and leftarg = 'tint' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_float WHERE temp &< f )
WHERE op = '&<' and leftarg = 'tint' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_intrange WHERE temp &< i )
WHERE op = '&<' and leftarg = 'tint' and rightarg = 'intrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp &< b )
WHERE op = '&<' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp &< t2.temp )
WHERE op = '&<' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp &< t2.temp )
WHERE op = '&<' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_int WHERE temp &< i )
WHERE op = '&<' and leftarg = 'tfloat' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_float WHERE temp &< f )
WHERE op = '&<' and leftarg = 'tfloat' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE temp &< f )
WHERE op = '&<' and leftarg = 'tfloat' and rightarg = 'floatrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp &< b )
WHERE op = '&<' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp &< t2.temp )
WHERE op = '&<' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp &< t2.temp )
WHERE op = '&<' and leftarg = 'tfloat' and rightarg = 'tfloat';

-------------------------------------------------------------------------------
-- Right
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tint WHERE i >> temp )
WHERE op = '>>' and leftarg = 'int' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tfloat WHERE i >> temp )
WHERE op = '>>' and leftarg = 'int' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tint WHERE f >> temp )
WHERE op = '>>' and leftarg = 'float' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tfloat WHERE f >> temp )
WHERE op = '>>' and leftarg = 'float' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_intrange, tbl_tint WHERE i >> temp )
WHERE op = '>>' and leftarg = 'intrange' and rightarg = 'tint';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE f >> temp )
WHERE op = '>>' and leftarg = 'floatrange' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b >> temp )
WHERE op = '>>' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b >> temp )
WHERE op = '>>' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_int WHERE temp >> i )
WHERE op = '>>' and leftarg = 'tint' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_float WHERE temp >> f )
WHERE op = '>>' and leftarg = 'tint' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_intrange WHERE temp >> i )
WHERE op = '>>' and leftarg = 'tint' and rightarg = 'intrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp >> b )
WHERE op = '>>' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp >> t2.temp )
WHERE op = '>>' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp >> t2.temp )
WHERE op = '>>' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_int WHERE temp >> i )
WHERE op = '>>' and leftarg = 'tfloat' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_float WHERE temp >> f )
WHERE op = '>>' and leftarg = 'tfloat' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE temp >> f )
WHERE op = '>>' and leftarg = 'tfloat' and rightarg = 'floatrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp >> b )
WHERE op = '>>' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp >> t2.temp )
WHERE op = '>>' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp >> t2.temp )
WHERE op = '>>' and leftarg = 'tfloat' and rightarg = 'tfloat';

-------------------------------------------------------------------------------
-- Overright
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tint WHERE i &> temp )
WHERE op = '&>' and leftarg = 'int' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_int, tbl_tfloat WHERE i &> temp )
WHERE op = '&>' and leftarg = 'int' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tint WHERE f &> temp )
WHERE op = '&>' and leftarg = 'float' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_float, tbl_tfloat WHERE f &> temp )
WHERE op = '&>' and leftarg = 'float' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_intrange, tbl_tint WHERE i &> temp )
WHERE op = '&>' and leftarg = 'intrange' and rightarg = 'tint';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE f &> temp )
WHERE op = '&>' and leftarg = 'floatrange' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b &> temp )
WHERE op = '&>' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b &> temp )
WHERE op = '&>' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_int WHERE temp &> i )
WHERE op = '&>' and leftarg = 'tint' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_float WHERE temp &> f )
WHERE op = '&>' and leftarg = 'tint' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_intrange WHERE temp &> i )
WHERE op = '&>' and leftarg = 'tint' and rightarg = 'intrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp &> b )
WHERE op = '&>' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp &> t2.temp )
WHERE op = '&>' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp &> t2.temp )
WHERE op = '&>' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_int WHERE temp &> i )
WHERE op = '&>' and leftarg = 'tfloat' and rightarg = 'int';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_float WHERE temp &> f )
WHERE op = '&>' and leftarg = 'tfloat' and rightarg = 'float';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_floatrange, tbl_tfloat WHERE temp &> f )
WHERE op = '&>' and leftarg = 'tfloat' and rightarg = 'floatrange';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp &> b )
WHERE op = '&>' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp &> t2.temp )
WHERE op = '&>' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp &> t2.temp )
WHERE op = '&>' and leftarg = 'tfloat' and rightarg = 'tfloat';

-------------------------------------------------------------------------------
-- Before
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tbool WHERE t <<# temp )
WHERE op = '<<#' and leftarg = 'timestamptz' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tint WHERE t <<# temp )
WHERE op = '<<#' and leftarg = 'timestamptz' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tfloat WHERE t <<# temp )
WHERE op = '<<#' and leftarg = 'timestamptz' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_ttext WHERE t <<# temp )
WHERE op = '<<#' and leftarg = 'timestamptz' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tbool WHERE ts <<# temp )
WHERE op = '<<#' and leftarg = 'timestampset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tint WHERE ts <<# temp )
WHERE op = '<<#' and leftarg = 'timestampset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tfloat WHERE ts <<# temp )
WHERE op = '<<#' and leftarg = 'timestampset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_ttext WHERE ts <<# temp )
WHERE op = '<<#' and leftarg = 'timestampset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tbool WHERE p <<# temp )
WHERE op = '<<#' and leftarg = 'period' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tint WHERE p <<# temp )
WHERE op = '<<#' and leftarg = 'period' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tfloat WHERE p <<# temp )
WHERE op = '<<#' and leftarg = 'period' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_ttext WHERE p <<# temp )
WHERE op = '<<#' and leftarg = 'period' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tbool WHERE ps <<# temp )
WHERE op = '<<#' and leftarg = 'periodset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tint WHERE ps <<# temp )
WHERE op = '<<#' and leftarg = 'periodset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tfloat WHERE ps <<# temp )
WHERE op = '<<#' and leftarg = 'periodset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_ttext WHERE ps <<# temp )
WHERE op = '<<#' and leftarg = 'periodset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b <<# temp )
WHERE op = '<<#' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b <<# temp )
WHERE op = '<<#' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestamptz WHERE temp <<# t )
WHERE op = '<<#' and leftarg = 'tbool' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestampset WHERE temp <<# ts )
WHERE op = '<<#' and leftarg = 'tbool' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_period WHERE temp <<# p )
WHERE op = '<<#' and leftarg = 'tbool' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_periodset WHERE temp <<# ps )
WHERE op = '<<#' and leftarg = 'tbool' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool t1, tbl_tbool t2 WHERE t1.temp <<# t2.temp )
WHERE op = '<<#' and leftarg = 'tbool' and rightarg = 'tbool';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestamptz WHERE temp <<# t )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestampset WHERE temp <<# ts )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_period WHERE temp <<# p )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_periodset WHERE temp <<# ps )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp <<# b )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp <<# t2.temp )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp <<# t2.temp )
WHERE op = '<<#' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestamptz WHERE temp <<# t )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestampset WHERE temp <<# ts )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_period WHERE temp <<# p )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_periodset WHERE temp <<# ps )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp <<# b )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp <<# t2.temp )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp <<# t2.temp )
WHERE op = '<<#' and leftarg = 'tfloat' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestamptz WHERE temp <<# t )
WHERE op = '<<#' and leftarg = 'ttext' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestampset WHERE temp <<# ts )
WHERE op = '<<#' and leftarg = 'ttext' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_period WHERE temp <<# p )
WHERE op = '<<#' and leftarg = 'ttext' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_periodset WHERE temp <<# ps )
WHERE op = '<<#' and leftarg = 'ttext' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext t1, tbl_ttext t2 WHERE t1.temp <<# t2.temp )
WHERE op = '<<#' and leftarg = 'ttext' and rightarg = 'ttext';

-------------------------------------------------------------------------------
-- Overbefore
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tbool WHERE t &<# temp )
WHERE op = '&<#' and leftarg = 'timestamptz' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tint WHERE t &<# temp )
WHERE op = '&<#' and leftarg = 'timestamptz' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tfloat WHERE t &<# temp )
WHERE op = '&<#' and leftarg = 'timestamptz' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_ttext WHERE t &<# temp )
WHERE op = '&<#' and leftarg = 'timestamptz' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tbool WHERE ts &<# temp )
WHERE op = '&<#' and leftarg = 'timestampset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tint WHERE ts &<# temp )
WHERE op = '&<#' and leftarg = 'timestampset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tfloat WHERE ts &<# temp )
WHERE op = '&<#' and leftarg = 'timestampset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_ttext WHERE ts &<# temp )
WHERE op = '&<#' and leftarg = 'timestampset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tbool WHERE p &<# temp )
WHERE op = '&<#' and leftarg = 'period' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tint WHERE p &<# temp )
WHERE op = '&<#' and leftarg = 'period' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tfloat WHERE p &<# temp )
WHERE op = '&<#' and leftarg = 'period' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_ttext WHERE p &<# temp )
WHERE op = '&<#' and leftarg = 'period' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tbool WHERE ps &<# temp )
WHERE op = '&<#' and leftarg = 'periodset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tint WHERE ps &<# temp )
WHERE op = '&<#' and leftarg = 'periodset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tfloat WHERE ps &<# temp )
WHERE op = '&<#' and leftarg = 'periodset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_ttext WHERE ps &<# temp )
WHERE op = '&<#' and leftarg = 'periodset' and rightarg = 'ttext';


UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b &<# temp )
WHERE op = '&<#' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b &<# temp )
WHERE op = '&<#' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestamptz WHERE temp &<# t )
WHERE op = '&<#' and leftarg = 'tbool' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestampset WHERE temp &<# ts )
WHERE op = '&<#' and leftarg = 'tbool' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_period WHERE temp &<# p )
WHERE op = '&<#' and leftarg = 'tbool' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_periodset WHERE temp &<# ps )
WHERE op = '&<#' and leftarg = 'tbool' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool t1, tbl_tbool t2 WHERE t1.temp &<# t2.temp )
WHERE op = '&<#' and leftarg = 'tbool' and rightarg = 'tbool';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestamptz WHERE temp &<# t )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestampset WHERE temp &<# ts )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_period WHERE temp &<# p )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_periodset WHERE temp &<# ps )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp &<# b )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp &<# t2.temp )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp &<# t2.temp )
WHERE op = '&<#' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestamptz WHERE temp &<# t )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestampset WHERE temp &<# ts )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_period WHERE temp &<# p )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_periodset WHERE temp &<# ps )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp &<# b )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp &<# t2.temp )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp &<# t2.temp )
WHERE op = '&<#' and leftarg = 'tfloat' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestamptz WHERE temp &<# t )
WHERE op = '&<#' and leftarg = 'ttext' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestampset WHERE temp &<# ts )
WHERE op = '&<#' and leftarg = 'ttext' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_period WHERE temp &<# p )
WHERE op = '&<#' and leftarg = 'ttext' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_periodset WHERE temp &<# ps )
WHERE op = '&<#' and leftarg = 'ttext' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext t1, tbl_ttext t2 WHERE t1.temp &<# t2.temp )
WHERE op = '&<#' and leftarg = 'ttext' and rightarg = 'ttext';

-------------------------------------------------------------------------------
-- After
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tbool WHERE t #>> temp )
WHERE op = '#>>' and leftarg = 'timestamptz' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tint WHERE t #>> temp )
WHERE op = '#>>' and leftarg = 'timestamptz' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tfloat WHERE t #>> temp )
WHERE op = '#>>' and leftarg = 'timestamptz' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_ttext WHERE t #>> temp )
WHERE op = '#>>' and leftarg = 'timestamptz' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tbool WHERE ts #>> temp )
WHERE op = '#>>' and leftarg = 'timestampset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tint WHERE ts #>> temp )
WHERE op = '#>>' and leftarg = 'timestampset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tfloat WHERE ts #>> temp )
WHERE op = '#>>' and leftarg = 'timestampset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_ttext WHERE ts #>> temp )
WHERE op = '#>>' and leftarg = 'timestampset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tbool WHERE p #>> temp )
WHERE op = '#>>' and leftarg = 'period' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tint WHERE p #>> temp )
WHERE op = '#>>' and leftarg = 'period' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tfloat WHERE p #>> temp )
WHERE op = '#>>' and leftarg = 'period' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_ttext WHERE p #>> temp )
WHERE op = '#>>' and leftarg = 'period' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tbool WHERE ps #>> temp )
WHERE op = '#>>' and leftarg = 'periodset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tint WHERE ps #>> temp )
WHERE op = '#>>' and leftarg = 'periodset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tfloat WHERE ps #>> temp )
WHERE op = '#>>' and leftarg = 'periodset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_ttext WHERE ps #>> temp )
WHERE op = '#>>' and leftarg = 'periodset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b #>> temp )
WHERE op = '#>>' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b #>> temp )
WHERE op = '#>>' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestamptz WHERE temp #>> t )
WHERE op = '#>>' and leftarg = 'tbool' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestampset WHERE temp #>> ts )
WHERE op = '#>>' and leftarg = 'tbool' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_period WHERE temp #>> p )
WHERE op = '#>>' and leftarg = 'tbool' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_periodset WHERE temp #>> ps )
WHERE op = '#>>' and leftarg = 'tbool' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool t1, tbl_tbool t2 WHERE t1.temp #>> t2.temp )
WHERE op = '#>>' and leftarg = 'tbool' and rightarg = 'tbool';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestamptz WHERE temp #>> t )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestampset WHERE temp #>> ts )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_period WHERE temp #>> p )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_periodset WHERE temp #>> ps )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp #>> b )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp #>> t2.temp )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp #>> t2.temp )
WHERE op = '#>>' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestamptz WHERE temp #>> t )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestampset WHERE temp #>> ts )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_period WHERE temp #>> p )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_periodset WHERE temp #>> ps )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp #>> b )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp #>> t2.temp )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp #>> t2.temp )
WHERE op = '#>>' and leftarg = 'tfloat' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestamptz WHERE temp #>> t )
WHERE op = '#>>' and leftarg = 'ttext' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestampset WHERE temp #>> ts )
WHERE op = '#>>' and leftarg = 'ttext' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_period WHERE temp #>> p )
WHERE op = '#>>' and leftarg = 'ttext' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_periodset WHERE temp #>> ps )
WHERE op = '#>>' and leftarg = 'ttext' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext t1, tbl_ttext t2 WHERE t1.temp #>> t2.temp )
WHERE op = '#>>' and leftarg = 'ttext' and rightarg = 'ttext';

-------------------------------------------------------------------------------
-- Overafter
-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tbool WHERE t #&> temp )
WHERE op = '#&>' and leftarg = 'timestamptz' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tint WHERE t #&> temp )
WHERE op = '#&>' and leftarg = 'timestamptz' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_tfloat WHERE t #&> temp )
WHERE op = '#&>' and leftarg = 'timestamptz' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestamptz, tbl_ttext WHERE t #&> temp )
WHERE op = '#&>' and leftarg = 'timestamptz' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tbool WHERE ts #&> temp )
WHERE op = '#&>' and leftarg = 'timestampset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tint WHERE ts #&> temp )
WHERE op = '#&>' and leftarg = 'timestampset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_tfloat WHERE ts #&> temp )
WHERE op = '#&>' and leftarg = 'timestampset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_timestampset, tbl_ttext WHERE ts #&> temp )
WHERE op = '#&>' and leftarg = 'timestampset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tbool WHERE p #&> temp )
WHERE op = '#&>' and leftarg = 'period' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tint WHERE p #&> temp )
WHERE op = '#&>' and leftarg = 'period' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_tfloat WHERE p #&> temp )
WHERE op = '#&>' and leftarg = 'period' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_period, tbl_ttext WHERE p #&> temp )
WHERE op = '#&>' and leftarg = 'period' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tbool WHERE ps #&> temp )
WHERE op = '#&>' and leftarg = 'periodset' and rightarg = 'tbool';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tint WHERE ps #&> temp )
WHERE op = '#&>' and leftarg = 'periodset' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_tfloat WHERE ps #&> temp )
WHERE op = '#&>' and leftarg = 'periodset' and rightarg = 'tfloat';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_periodset, tbl_ttext WHERE ps #&> temp )
WHERE op = '#&>' and leftarg = 'periodset' and rightarg = 'ttext';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tint WHERE b #&> temp )
WHERE op = '#&>' and leftarg = 'tbox' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbox, tbl_tfloat WHERE b #&> temp )
WHERE op = '#&>' and leftarg = 'tbox' and rightarg = 'tfloat';

-------------------------------------------------------------------------------

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestamptz WHERE temp #&> t )
WHERE op = '#&>' and leftarg = 'tbool' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_timestampset WHERE temp #&> ts )
WHERE op = '#&>' and leftarg = 'tbool' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_period WHERE temp #&> p )
WHERE op = '#&>' and leftarg = 'tbool' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool, tbl_periodset WHERE temp #&> ps )
WHERE op = '#&>' and leftarg = 'tbool' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tbool t1, tbl_tbool t2 WHERE t1.temp #&> t2.temp )
WHERE op = '#&>' and leftarg = 'tbool' and rightarg = 'tbool';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestamptz WHERE temp #&> t )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_timestampset WHERE temp #&> ts )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_period WHERE temp #&> p )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_periodset WHERE temp #&> ps )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint, tbl_tbox WHERE temp #&> b )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tint t2 WHERE t1.temp #&> t2.temp )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tint t1, tbl_tfloat t2 WHERE t1.temp #&> t2.temp )
WHERE op = '#&>' and leftarg = 'tint' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestamptz WHERE temp #&> t )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_timestampset WHERE temp #&> ts )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_period WHERE temp #&> p )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_periodset WHERE temp #&> ps )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat, tbl_tbox WHERE temp #&> b )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'tbox';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tint t2 WHERE t1.temp #&> t2.temp )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'tint';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_tfloat t1, tbl_tfloat t2 WHERE t1.temp #&> t2.temp )
WHERE op = '#&>' and leftarg = 'tfloat' and rightarg = 'tfloat';

UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestamptz WHERE temp #&> t )
WHERE op = '#&>' and leftarg = 'ttext' and rightarg = 'timestamptz';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_timestampset WHERE temp #&> ts )
WHERE op = '#&>' and leftarg = 'ttext' and rightarg = 'timestampset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_period WHERE temp #&> p )
WHERE op = '#&>' and leftarg = 'ttext' and rightarg = 'period';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext, tbl_periodset WHERE temp #&> ps )
WHERE op = '#&>' and leftarg = 'ttext' and rightarg = 'periodset';
UPDATE test_relativeposops
SET spgistidx = ( SELECT count(*) FROM tbl_ttext t1, tbl_ttext t2 WHERE t1.temp #&> t2.temp )
WHERE op = '#&>' and leftarg = 'ttext' and rightarg = 'ttext';

-------------------------------------------------------------------------------

DROP INDEX tbl_tbool_spgist_idx;
DROP INDEX tbl_tint_spgist_idx;
DROP INDEX tbl_tfloat_spgist_idx;
DROP INDEX tbl_ttext_spgist_idx;

-------------------------------------------------------------------------------

SELECT * FROM test_relativeposops
WHERE noidx <> spgistidx 
ORDER BY op, leftarg, rightarg;

DROP TABLE test_relativeposops;

-------------------------------------------------------------------------------