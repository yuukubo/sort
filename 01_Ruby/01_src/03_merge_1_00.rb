require "logger"
log = Logger.new("./merge_sort.log", "dright_lenly") # make log file at current directory
log2 = Logger.new("./merge_sorted.log", "dright_lenly") # make log file at current directory
log.info("Program started")
$t_start = 0
$t_end = 0
$t_pass = 0
$t_sum = 0

num_times = 10000
arr_num = [] # ランダム配列用
num_times.times{arr_num << rand(1..10000) } # ランダム配列生成
log2.info("\nsort \n#{arr_num} \nby merge sort algo.\n")
$t_start = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }

def merge_sort(input_arr, input_arr_len) # 配列と配列サイズ受け取り
  return if input_arr_len <= 1 # 配列サイズが１ならメソッド終了

  left_len = input_arr_len / 2 # 左の配列サイズは整数で半分。例えば7 / 2 = 3となる。
  merge_sort input_arr, left_len # ランダム配列の左半分について再起呼び出し。
  # 配列サイズ１で返されるまでループ。
  right_arr = input_arr[left_len..input_arr_len - 1] # 右半分を変数代入。
  merge_sort right_arr, input_arr_len - left_len # 右半分も再起呼び出し。
  # 配列サイズ１で返されるまでループ。
  input_arr[input_arr_len - left_len..input_arr_len - 1] = input_arr[0..left_len - 1] # 左半分を右半分にコピー。
  # right_arrに右半分は残っている。
  out_ctr = 0 # 外側ループカウンタ
  right_len = input_arr_len - left_len # 右半分の配列サイズ
  in_ctr = 0 # 内側ループカウンタ
  while in_ctr < input_arr_len - left_len # 内側ループカウンタが右側サイズより小さい間ループ
    if right_len < input_arr_len && input_arr[right_len] <= right_arr[in_ctr]
      # 元配列サイズより右側配列サイズが小さい、且つ右側最初の配列が内側ループカウンタ添字の配列以下のなら、
      input_arr[out_ctr] = input_arr[right_len] # 外側ループカウンタ添字の配列へ右側最初の配列を代入
      right_len += 1 # 右側サイズをインクリメント
    else # その他の場合
      input_arr[out_ctr] = right_arr[in_ctr] # 内側カウンタ添字配列を外側へ
      in_ctr += 1 # 内側ループカウンタをインクリメント
    end # if終了
    out_ctr += 1 # 外側ループカウンタをインクリメント
  end # while終了。正直処理の意味が分からない。
  $t_end = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
  $t_pass = $t_end - $t_start
  $t_sum += $t_pass
end

merge_sort(arr_num, arr_num.length) # 引数はランダム配列と配列サイズ

log2.info("\n\nsorted : \n#{arr_num}.\n")

$t_sum = $t_sum / 1000.0 # ms to sec
$t_sum = $t_sum / num_times # get average ms
log.info("Program end. #{num_times} num sorted. average time : #{$t_sum} sec ")
