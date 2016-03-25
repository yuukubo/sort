require 'logger'
log = Logger.new('./bubble_sort.log', 'daily') # make log file at current directory
log2 = Logger.new('./bubble_sorted.log', 'daily') # make log file at current directory
log.info("Program started")
$t_start = 0
$t_end = 0
$t_pass = 0
$t_sum = 0

num_times = 10000
$arr_num = []
num_times.times{$arr_num << rand(1..10000) }
log2.info("\nsort \n#{$arr_num} \nby bubble sort algo.\n")
def bubble_sort
  $t_start = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
  $arr_num.length.times do |out_ctr|
    $arr_num.length.times do |in_ctr|
      unless in_ctr == $arr_num.length - 1
        if $arr_num[in_ctr] > $arr_num[in_ctr + 1]
          wk_num = $arr_num[in_ctr]
          $arr_num[in_ctr] = $arr_num[in_ctr + 1]
          $arr_num[in_ctr + 1] = wk_num
        end
      end
    end
  end
  $t_end = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
  $t_pass = $t_end - $t_start
  $t_sum += $t_pass
end

bubble_sort

log2.info("\n\nsorted : \n#{$arr_num}.\n")

$t_sum = $t_sum / 1000.0 # ms to sec
$t_sum = $t_sum / num_times # get average ms
log.info("Program end. #{num_times} num sorted. average time : #{$t_sum} sec ")
