/*****************************************************************************
 *
 * This MobilityDB code is provided under The PostgreSQL License.
 *
 * Copyright (c) 2016-2021, Université libre de Bruxelles and MobilityDB
 * contributors
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without a written
 * agreement is hereby granted, provided that the above copyright notice and
 * this paragraph and the following two paragraphs appear in all copies.
 *
 * IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
 * LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
 * EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON
 * AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS. 
 *
 *****************************************************************************/

/**
 * @file tnpoint_posops.c
 * Relative position operators for temporal network points.
 */

#ifndef __TNPOINT_POSOPS_H__
#define __TNPOINT_POSOPS_H__

#include <postgres.h>
#include <catalog/pg_type.h>
#include <fmgr.h>

/*****************************************************************************/

extern Datum left_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum overleft_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum right_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum overright_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum below_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum overbelow_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum above_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum overabove_npoint_tnpoint(PG_FUNCTION_ARGS);
extern Datum left_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum overleft_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum right_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum overright_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum below_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum overbelow_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum above_tnpoint_npoint(PG_FUNCTION_ARGS);
extern Datum overabove_tnpoint_npoint(PG_FUNCTION_ARGS);

/*****************************************************************************/

#endif /* __TNPOINT_POSOPS_H__ */
