require 'logger'
log = Logger.new('./insert_sort.log', 'daily') # make log file at current directory
log2 = Logger.new('./insert_sorted.log', 'daily') # make log file at current directory
log.info("Program started")
$t_start = 0
$t_end = 0
$t_pass = 0
$t_sum = 0

num_times = 10000
arr_num = [] # ランダム配列用
num_times.times{arr_num << rand(1..10000) } # ランダム配列生成
log2.info("\nsort \n#{arr_num} \n by insert sort algo.\n")

def eval(base_arr, next_num)
  base_arr.length.times {|ctr|
  if base_arr[ctr] > next_num
    return ctr
  elsif base_arr.length - 1 == ctr
    return ctr + 1
  end
  }
end

def insrt(base_arr)
  $t_start = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
  next_num = []
  insrt_ctr = 0

  (base_arr.length - 1).times {|ctr|
  next_num = base_arr[ctr + 1]
  insrt_ctr = eval(base_arr[0..ctr], next_num)
  base_arr.delete_at(ctr + 1)
  base_arr.insert(insrt_ctr, next_num)
  base_arr
  }
  $t_end = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
  $t_pass = $t_end - $t_start
  $t_sum += $t_pass

  base_arr
end

arr_num = insrt arr_num

log2.info("\n\nsorted : \n#{arr_num}.\n")
$t_sum = $t_sum / 1000.0 # ms to sec
$t_sum = $t_sum / num_times # get average ms
log.info("Program end. #{num_times} num sorted. average time : #{$t_sum} sec ")
