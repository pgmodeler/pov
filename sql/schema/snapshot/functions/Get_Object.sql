CREATE OR REPLACE FUNCTION Get_Object(_ObjectID bigint) RETURNS TEXT AS $BODY$
DECLARE
_Content text;
BEGIN
SELECT Content INTO _Content FROM Objects WHERE ObjectID = _ObjectID;
IF NOT FOUND THEN
    RAISE EXCEPTION 'ERROR_OBJECT_NOT_FOUND ObjectID %', _ObjectID;
END IF;
RETURN _Content;
END;
$BODY$ LANGUAGE plpgsql STABLE;