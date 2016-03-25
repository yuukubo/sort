require 'logger'
log = Logger.new('./merge_sort.log', 'daily') # make log file at current directory
log2 = Logger.new('./merge_sorted.log', 'daily') # make log file at current directory
log.info("Program started")
$t_start = 0
$t_end = 0
$t_pass = 0
$t_sum = 0

num_times = 10000
arr_num = [] # ランダム配列用
num_times.times{arr_num << rand(1..10000) } # ランダム配列生成
log2.info("\nsort \n#{arr_num} \n by merge sort algo.\n")

# 整列統合
def merg(left_arr, right_arr)
  merg_arr = []
  while right_arr.length >= 0 do
    if left_arr.first.to_i < right_arr.first.to_i
      merg_arr << left_arr.shift
    else
      merg_arr << right_arr.shift
    end

    if left_arr.length == 0
      right_arr.length.times{
        merg_arr << right_arr.shift
      }
      break
    end

    if right_arr.length == 0
      left_arr.length.times{
        merg_arr << left_arr.shift
      }
      break
    end
  end
  merg_arr
end

# 分割
def div(input_arr, input_arr_len)
  $t_start = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }

  return if input_arr_len <= 1
  left_len = input_arr_len / 2
  left_arr = input_arr[0..left_len - 1]
  sort_left = div(left_arr, left_len)
  sort_left = left_arr if sort_left == nil

  right_len = input_arr_len - left_len
  right_arr = input_arr[left_len.. input_arr_len - 1]
  sort_right = div(right_arr, right_len)
  sort_right = right_arr if sort_right == nil

  input_arr = merg(sort_left, sort_right)

  $t_end = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
  $t_pass = $t_end - $t_start
  $t_sum += $t_pass

  input_arr
end

arr_num = div(arr_num, arr_num.length)
log2.info("\n\nsorted : \n#{arr_num}.\n")
$t_sum = $t_sum / 1000.0 # ms to sec
log.info("Program end. #{num_times} num sorted. totle time : #{$t_sum} sec ")
