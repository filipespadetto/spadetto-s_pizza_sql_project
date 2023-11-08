SELECT
    r.date,
    s.first_name,
    s.last_name,
    s.hourly_rate,
    sh.start_time,
    sh.end_time,
    ((EXTRACT(HOUR FROM (TO_TIMESTAMP(sh.end_time, 'HH24:MI:SS') - TO_TIMESTAMP(sh.start_time, 'HH24:MI:SS')))*60) +
    EXTRACT(MINUTE FROM (TO_TIMESTAMP(sh.end_time, 'HH24:MI:SS') - TO_TIMESTAMP(sh.start_time, 'HH24:MI:SS'))))/60 as hours_in_shift,
    ((EXTRACT(HOUR FROM (TO_TIMESTAMP(sh.end_time, 'HH24:MI:SS') - TO_TIMESTAMP(sh.start_time, 'HH24:MI:SS')))*60) +
    EXTRACT(MINUTE FROM (TO_TIMESTAMP(sh.end_time, 'HH24:MI:SS') - TO_TIMESTAMP(sh.start_time, 'HH24:MI:SS'))))/60 * s.hourly_rate as staff_cost
FROM rota r
LEFT JOIN staff s on r.staff_id = s.staff_id
LEFT JOIN shift sh on r.shift_id = sh.shift_id;
