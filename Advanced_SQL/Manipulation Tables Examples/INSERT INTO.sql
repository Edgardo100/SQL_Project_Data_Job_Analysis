INSERT INTO job_applied
    (job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
    )
VALUES ( 
    1, 
    '2024-06-01', 
    TRUE, 
    'resume_john_doe.pdf', 
    TRUE, 
    'cover_letter_john_doe.pdf', 
    'Pending'
), (
    2, 
    '2024-06-02', 
    FALSE, 
    NULL, 
    TRUE, 
    'cover_letter_jane_smith.pdf', 
    'Reviewed'
), 
(
    3, 
    '2024-06-03', 
    TRUE, 
    'resume_alex_jones.pdf', 
    FALSE, 
    NULL, 
    'Interview Scheduled'
),
(
    4, 
    '2024-06-04', 
    FALSE, 
    NULL, 
    FALSE, 
    NULL, 
    'Rejected'
), 
(
    5, 
    '2024-06-05', 
    TRUE, 
    'resume_emily_clark.pdf', 
    TRUE, 
    'cover_letter_emily_clark.pdf', 
    'Offer Extended'
);

SELECT * 

FROM job_applied;
