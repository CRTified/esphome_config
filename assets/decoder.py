from os import walk, path

def avg(xs):
    return sum(xs) // len(xs)

def read_codes(f):
    codes = []
    curr_elem = []
    for l in f:
        if l[0] == "#":
            continue
        l1 = "".join(filter(lambda x: x in "-,0123456789", l[31:]))
        vals = [int(n) for n in l1.split(",") if n]
        if vals:
            curr_elem += vals
        else:
            if curr_elem:
                codes.append(curr_elem)
                curr_elem = []
    if len(set(len(xs) for xs in (zip(*codes)))) != 1:
        print([len(xs) for xs in (zip(*codes))])
    return [avg(xs) for xs in (zip(*codes))]


codes = {

}
for root, dirs, files in walk("./decode/"):
    print(root)
    for name in files:
        code = read_codes(open(path.join(root, name)))
        codes[name] = code
        print(name, len(code))
        print(code)
        print()

common_times = [max(c) - min(c) for c in zip(*codes.values())]
avgs = [(avg(c) // 10) * 10 for c in zip(*codes.values())]
print("common")
print("===========")
print([1 if r < 40 else 0 for r in common_times])
print(avgs)
for name, c in codes.items():
    #print(name)
    print([avgs[i] if r < 40 else c[i] for i, r in enumerate(common_times)])
