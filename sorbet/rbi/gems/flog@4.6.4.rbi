# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `flog` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

File::RUBY19 = T.let(T.unsafe(nil), TrueClass)

class Flog < ::MethodBasedSexpProcessor
  def initialize(option = T.unsafe(nil)); end

  def add_to_score(name, score = T.unsafe(nil)); end
  def average; end
  def calculate; end
  def calculate_total_scores; end
  def calls; end
  def dsl_name?(args); end
  def each_by_score(max = T.unsafe(nil)); end
  def flog(*files); end
  def flog_ruby(ruby, file = T.unsafe(nil), timeout = T.unsafe(nil)); end
  def flog_ruby!(ruby, file = T.unsafe(nil), timeout = T.unsafe(nil)); end
  def mass; end
  def max_method; end
  def max_score; end
  def method_scores; end
  def multiplier; end
  def multiplier=(_arg0); end
  def no_method; end
  def option; end
  def penalize_by(bonus); end
  def process_alias(exp); end
  def process_and(exp); end
  def process_attrasgn(exp); end
  def process_block(exp); end
  def process_block_pass(exp); end
  def process_call(exp); end
  def process_case(exp); end
  def process_class(exp); end
  def process_dasgn_curr(exp); end
  def process_else(exp); end
  def process_iasgn(exp); end
  def process_if(exp); end
  def process_iter(exp); end
  def process_lasgn(exp); end
  def process_lit(exp); end
  def process_masgn(exp); end
  def process_or(exp); end
  def process_rescue(exp); end
  def process_safe_call(exp); end
  def process_sclass(exp); end
  def process_super(exp); end
  def process_until(exp); end
  def process_when(exp); end
  def process_while(exp); end
  def process_yield(exp); end
  def reset; end
  def score_method(tally); end
  def scores; end
  def threshold; end
  def threshold=(_arg0); end
  def total_score; end
  def totals; end
end

Flog::BRANCHING = T.let(T.unsafe(nil), Array)
Flog::DEFAULT_THRESHOLD = T.let(T.unsafe(nil), Float)
Flog::OTHER_SCORES = T.let(T.unsafe(nil), Hash)
Flog::SCORES = T.let(T.unsafe(nil), Hash)
Flog::THRESHOLD = T.let(T.unsafe(nil), Float)
Flog::VERSION = T.let(T.unsafe(nil), String)