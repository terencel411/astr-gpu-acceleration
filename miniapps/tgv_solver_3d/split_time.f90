program merge_files
    use ieee_arithmetic
    ! 
    implicit none
    character(len=33) :: line1, line2, line3, line4
    integer :: unit1, unit2, unit3, ios, i
    real(8) :: num1, num2, num3
    logical :: flag = .true.

    ! Open the input files
    open(unit=10, file='time_report_cpu.txt', status='old', action='read')
    open(unit=20, file='time_report_gpu.txt', status='old', action='read')
    open(unit=30, file='tr_cpu.txt', status='old', action='read')
    open(unit=40, file='tr_gpu.txt', status='old', action='read')
    open(unit=50, file='time_report.txt', status='unknown', action='write')

    do
        read(10, '(A)', iostat=ios) line1
        if (ios /= 0) exit
        read(20, '(A)', iostat=ios) line2
        if (ios /= 0) exit
        read(30, '(A)', iostat=ios) line3
        if (ios /= 0) exit
        read(40, '(A)', iostat=ios) line4
        if (ios /= 0) exit
        
        
        read(line3, '(F13.3)', IOSTAT=i) num1
        read(line4, '(F13.3)', IOSTAT=i) num2
        num3 = num1/num2

        ! print *, num1, num2
        if (ieee_is_nan(num3)) then
            if (flag) then
                write(50, '(A, "|", A, "|", A)') line1, line2, " acceleration"
                flag = .false.
            else
                write(50, '(A, "|", A, "|")') line1, line2
            end if
        else
            write(50, '(A, "|", A, "|", F13.1)') line1, line2, num3
        end if
        
    end do
    
    close(10)
    close(20)
    close(30)
    close(40)
    close(50)

    print *, 'Files merged successfully!'
end program merge_files
