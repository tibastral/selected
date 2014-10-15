selected
========

This gem is useful for links and can add the class 'selected' to current pages

usage

    %li= link_to 'Admin', edit_job_board_path(current_job_board), class: selected?(:job_boards, [:edit, :update])
